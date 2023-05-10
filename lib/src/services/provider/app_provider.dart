import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/models/names_kz.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:flutter/material.dart';

class AppNotifier extends ChangeNotifier {
  AllahNames? _allahNames;

  AllahNames? get getAllahNames => _allahNames;

  // setter
  void setAllahNames(AllahNames allahNames) {
    _allahNames = allahNames;
    notifyListeners();
  }

  void addTranslatedNames({required TranslatedName key, required List<AllahName> names}) {
    switch (key) {
      case TranslatedName.en:
        _allahNames!.allahNamesEN.addAll(names);
        break;
      case TranslatedName.kz:
        _allahNames!.allahNamesKZ.addAll(names);
        break;
      case TranslatedName.ru:
        _allahNames!.allahNamesRU.addAll(names);
        break;
      case TranslatedName.tr:
        _allahNames!.allahNamesTR.addAll(names);
        break;
    }
    notifyListeners();
  }

  // clear all
  void clearAll() {
    _allahNames = null;
    notifyListeners();
  }
}
