import 'package:hive_flutter/hive_flutter.dart';
import 'package:twodu/models/task_model.dart';

class DataTask {
  final task_list = Hive.box("taskBox");

  List todotask = [];

  void createInitData() async {
    Task init_task = Task(
      title: 'first task',
      description: 'nothing to describe',
      frequency: "Select frequency",
      dueday: DateTime.now(),
      isCompleted: false,
    );
    todotask.add(init_task);

    updateDatabase();
  }

  void add_task(Task task) async {
    todotask.add(task);
    updateDatabase();
  }

  //load the data from our database
  void loadData() {
    todotask = task_list.get('taskcollection');
  }

  //update database
  //update database
  void updateDatabase() {
    task_list.put('taskcollection', todotask);
  }

  void delete_task(int index) async {
    todotask.removeAt(index);
    updateDatabase();
  }
}
