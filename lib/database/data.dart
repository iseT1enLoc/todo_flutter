import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DataTask {
  /* static final DataTask _instance = DataTask._internal();
  List todoList = [
    [
      "Nau an luc 11h AM",
      "Description",
      "everyday",
      DateTime.utc(2024, 11, 34),
      true
    ], 
    [
      "On thi nmlt",
      "Description 2",
      "usually",
      DateTime.utc(2024, 11, 34),
      false
    ] 
  ];

  factory DataTask() {
    return _instance;
  }

  DataTask._internal(); */
  List todoList = [];

  //reference our box
  final _tasklist = Hive.box("todolist");

  //run this method if it is the first time opening the app
  void createInitData() {
    todoList.add([
      "App note",
      "nothing",
      "nothing",
      DateTime.utc(2024, 5, 6),
      false,
    ]);
  }

  //load the data from our database
  void loadData() {
    todoList = _tasklist.get('TASKLIST');
  }

  //update database
  void updateDatabase() {
    _tasklist.put('TASKLIST', todoList);
    _tasklist.put("TASKLIST", todoList);
  }
}
