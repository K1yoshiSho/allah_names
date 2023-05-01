import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:flutter/material.dart';

class AppNotifier extends ChangeNotifier {
  List<AllahNameKZ> allahNameKZ = [];
  double initialOffsetMainPage = 0.0;
  // AllahNameRU? allahNameRU;
  // AllahNameEN? allahNameEN;
  // AllahNameTR? allahNameTR;

  // getters
  List<AllahNameKZ> get getAllahNameKZ => allahNameKZ;
  double get getInitialOffsetMainPage => initialOffsetMainPage;

  // setters
  void setAllahNameKZ(List<AllahNameKZ> allahNameKZ) {
    this.allahNameKZ = allahNameKZ;
    notifyListeners();
  }

  void setInitialOffsetMainPage(double initialOffsetMainPage) {
    this.initialOffsetMainPage = initialOffsetMainPage;
    notifyListeners();
  }

  // clear all
  void clearAll() {
    allahNameKZ.clear();
    initialOffsetMainPage = 0.0;
    notifyListeners();
  }
}
