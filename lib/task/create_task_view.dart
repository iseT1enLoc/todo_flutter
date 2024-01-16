import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    const List<String> _items = <String>[
      'Select Frequency',
      'One',
      'Two',
      'Three',
      'Four'
    ];
    double screen_width = MediaQuery.of(context).size.width;
    String dropdownValue = _items.first;
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
                value: dropdownValue,
                items: _items
                    .map<DropdownMenuItem<String>>(
                      (String value) =>
                          DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                hint: const Text("Select frenquency"),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value.toString();
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
                  selectedDate = value;
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
                onPressed: () {},
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
                onPressed: () {},
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
