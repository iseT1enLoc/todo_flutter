import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:twodu/const/const.dart';
import 'package:twodu/database/data.dart';
import 'package:twodu/task/edit.dart';
import 'package:twodu/task/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final _tasklist = Hive.box("todolist");
  DataTask db = DataTask();
  void setCheckedBoxState(bool? value, int index) {
    setState(() {
      db.todoList[index][4] = !db.todoList[index][4];
    });
    db.updateDatabase();
  }

  void deleteFunction(int index) {
    db.todoList.removeAt(index);
    db.updateDatabase();
    Navigator.of(context).pushNamedAndRemoveUntil(
      taskList,
      (route) => false,
    );
  }

  @override
  void initState() {
    if (_tasklist.get('TASKLIST') == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        title: const Text("All task"),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Task(
              title: db.todoList[index][0],
              isCompleted: db.todoList[index][4],
              Frequency: db.todoList[index][2] == 'Select Frequency'
                  ? ''
                  : db.todoList[index][2],
              dueDay: db.todoList[index][3],
              onChecked: (value) => setCheckedBoxState(value, index),
              deletetask: (BuildContext) {
                deleteFunction(index);
              },
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext builder) => UpdateView(index: index)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(createRoute),
        child: const Icon(Icons.add),
      ),
    );
  }
}
