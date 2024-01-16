import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String title;

  String? Frequency;

  late DateTime dueDay;
  bool isCompleted = false;
  Function(bool?)? onChecked; //

  Task({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.Frequency,
    required this.dueDay,
    required this.onChecked,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  String? Description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
