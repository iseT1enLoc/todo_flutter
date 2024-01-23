import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:twodu/const/routes.dart';
import 'package:twodu/models/task_model.dart';
import 'package:twodu/screens/create_task.dart';
import 'package:twodu/screens/read_task_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = Directory.current.path;
  await Hive
    ..init(documentDirectory)
    ..registerAdapter(task_adapter());
  //init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox("taskBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
