import 'package:flutter/material.dart';
import 'package:twodu/task/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoTask = [
    ["Morning excercise", false],
    ["Afternoon task", false],
  ];

  void setCheckedBoxState(bool? value, int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: todoTask.length,
        itemBuilder: (context, index) {
          return Task(
            title: todoTask[index][0],
            isCompleted: todoTask[index][1],
            Frequency: "Every day",
            dueDay: "20/5/2020",
            onChanged: (value) => setCheckedBoxState(value, index),
          );
        },
      ),
    );
  }
}
