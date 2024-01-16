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
