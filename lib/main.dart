import 'package:flutter/material.dart';
import 'package:twodu/home.dart';
import 'package:twodu/task/create_task_view.dart';
import 'package:twodu/task/task.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 110, 40, 231)),
      useMaterial3: true,
    ),
    home: const CreateView(),
    debugShowCheckedModeBanner: false,
  ));
}
