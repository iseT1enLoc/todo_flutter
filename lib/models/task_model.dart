import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0, adapterName: "task_adapter")
class Task {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? frequency;
  @HiveField(3)
  DateTime? dueday;
  @HiveField(4)
  bool? isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.frequency,
    required this.dueday,
    required this.isCompleted,
  });
}
