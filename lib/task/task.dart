import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  bool isChecked = false;

  final String title;

  String? Description;

  String? Frequency;

  late String dueDay;
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
          children: [
            Checkbox(
              checkColor: Colors.black,
              value: isCompleted,
              onChanged: onChecked,
              activeColor: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                Text(
                  dueDay + " " + Frequency.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
