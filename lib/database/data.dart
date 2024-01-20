import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DataTask {
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
