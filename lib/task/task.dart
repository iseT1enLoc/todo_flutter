import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.black,
              value: isChecked,
              onChanged: (p0) {},
            ),
            const Column(
              children: [
                Text("Running on the floor"),
                Text(
                  "22/3/2004 Everyday",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
