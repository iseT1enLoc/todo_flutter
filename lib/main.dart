import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:twodu/const/const.dart';
import 'package:twodu/task/edit.dart';
import 'package:twodu/tasklist.dart';
import 'package:twodu/task/create_task_view.dart';
import 'package:twodu/task/task.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox("todolist");
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 110, 40, 231)),
      useMaterial3: true,
    ),
    home: const TaskList(),
    routes: {
      taskList: (context) => const TaskList(),
      createRoute: (context) => CreateView(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
