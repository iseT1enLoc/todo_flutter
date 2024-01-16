class DataTask {
  static final DataTask _instance = DataTask._internal();
  List todoList = [
    ["Nau an luc 11h AM", true],
    ["On thi nmlt", false]
  ];

  factory DataTask() {
    return _instance;
  }

  DataTask._internal();
}
