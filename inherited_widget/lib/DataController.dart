import 'package:flutter/foundation.dart';

class DataController with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  List<String> list = ['abc', 'def'];

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void addItem(String value) {
    list.add(value);
    notifyListeners();
  }

  void removeItem(String value) {
    list.remove(value);
    notifyListeners();
  }
}
