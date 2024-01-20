import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:twodu/task/create_task_view.dart';
import 'package:twodu/task/edit.dart';

class Task extends StatefulWidget {
  final String title;

  String? Frequency;

  late DateTime dueDay;
  bool isCompleted = false;
  Function(bool?)? onChecked; //
  Function(BuildContext) deletetask;

  Task({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.Frequency,
    required this.dueDay,
    required this.onChecked,
    required this.deletetask,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  String? Description;

  void UpdateFunction() {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
              onPressed: widget.deletetask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10.0))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                value: widget.isCompleted,
                onChanged: widget.onChecked,
                activeColor: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        decoration: widget.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Text(
                    widget.dueDay.toString().substring(0, 11) +
                        " " +
                        widget.Frequency.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      decoration: widget.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
