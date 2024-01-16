class Frequence {
  static final Frequence _instance = Frequence._internal();
  List<String> items = <String>[
    'Select Frequency',
    'everyday',
    'two',
    'Three',
    'Four'
  ];
  factory Frequence() {
    return _instance;
  }

  Frequence._internal();
}
