import 'package:flutter/material.dart';
import 'package:twodu/const/routes.dart';
import 'package:twodu/screens/create_task.dart';
import 'package:twodu/screens/read_task_list.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
