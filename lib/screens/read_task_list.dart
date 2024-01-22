import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:twodu/const/routes.dart';
import 'package:twodu/database/data.dart';

import 'package:twodu/screens/edit_task.dart';
import 'package:twodu/components/task_card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final _tasklist = Hive.box("taskBox");
  DataTask db = DataTask();

  void setCheckedBoxState(bool? value, int index) {
    setState(() {
      bool? current_state = db.todotask[index].isCompleted;
      db.todotask[index].isCompleted = !current_state!;
    });
  }

  void deleteFunction(int index) {
    db.delete_task(index);
    Navigator.of(context).pushNamedAndRemoveUntil(
      taskList,
      (route) => false,
    );
  }

  @override
  void initState() {
    if (_tasklist.get('taskcollection') == null) {
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
        title: const Text("All tasks"),
      ),
      body: /*  db.todotask.length == 0
          ? Container(
              child: const Text("Nothing to display for you"),
            )
          : */
          ListView.builder(
        itemCount: db.todotask.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: TaskCard(
              title: db.todotask[index].title,
              isCompleted: db.todotask[index].isCompleted,
              Frequency: db.todotask[index].frequency == 'Select Frequency'
                  ? ''
                  : db.todotask[index].frequency,
              dueDay: db.todotask[index].dueday,
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
