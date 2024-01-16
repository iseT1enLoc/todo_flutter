import 'dart:async';

Future<int> multiply2number(int a, int b) async {
  return Future.delayed(
    const Duration(seconds: 2),
    () => "delay 2 seconds",
  ).then((value) => a * b);
}

void main() async {
  int a = 6, b = 10;

  print(await multiply2number(a, b));
}
DropdownButton(
                    // Initial Value
                    value: dropdownValue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  )