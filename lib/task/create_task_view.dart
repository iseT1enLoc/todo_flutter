import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:twodu/const/const.dart';
import 'package:twodu/database/FrequenData.dart';
import 'package:twodu/database/data.dart';

class CreateView extends StatefulWidget {
  /* const CreateView({super.key}); */

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  DateTime? _selectedDate;
  late TextEditingController title;
  late TextEditingController description;
  late String frequence;
  /* final void Function(BuildContext) onAdd; */
  final _tasklist = Hive.box("todolist");
  DataTask db = DataTask();
  void SaveNewTask() {
    db.todoList.add([
      title.text,
      description.text,
      frequence,
      DateTime.utc(2024, 5, 6),
      false
    ]);
    title.clear();
    description.clear();
    db.updateDatabase();
    Navigator.of(context).pushNamedAndRemoveUntil(
      taskList,
      (Route route) => false,
    );
  }

  @override
  void initState() {
    title = TextEditingController();
    description = TextEditingController();
    frequence = "Select frequence";
    if (_tasklist.get('TASKLIST') == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _items = <String>[
      'Select Frequency',
      'everyday',
      '2 times a week',
      '3 times a week',
      'twice a month',
    ];
    String _dropdownValue = _items[0];
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        title: const Text("Add Tasks",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title input
              const Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //Description
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              TextField(
                controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter your description",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //Select frequency
              const Text(
                "Select Frequency",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  /* hintText: "Select frequency", */
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: _dropdownValue,
                items: _items
                    .map<DropdownMenuItem<String>>(
                      (String value) =>
                          DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                hint: const Text("Select frenquency"),
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value.toString();
                    frequence = _dropdownValue;
                  });
                },
              ), //Due date
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Due Date",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              DateTimeFormField(
                decoration: const InputDecoration(
                  hintText: 'Select due day',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialPickerDateTime:
                    DateTime.now().add(const Duration(days: 20)),
                onChanged: (DateTime? value) {
                  _selectedDate = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(screen_width, 20),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  SaveNewTask();
                },
                child: const Text('Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(screen_width, 20),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
