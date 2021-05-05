import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  String _data = 'Top level data of top widget.';

  String get getData => _data;

  void changeString(String newString) {
    _data = newString;
    notifyListeners();
  }
}
