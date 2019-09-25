import 'package:flutter/material.dart';
//首页tab切换provide
class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
