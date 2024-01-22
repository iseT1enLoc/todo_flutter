import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:twodu/components/my_app.dart';
import 'package:twodu/models/task_model.dart';

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
  runApp(MyApp());
}
