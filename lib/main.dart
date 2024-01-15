import 'package:flutter/material.dart';
import 'package:twodu/home.dart';
import 'package:twodu/task/task.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const Home(),
    debugShowCheckedModeBanner: false,
  ));
}
