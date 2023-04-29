import 'package:allah_names/src/common/utils/utils.dart';
import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale? locale;

  Locale get getLocale => locale ?? sharedPreference.locale;

  // void setLocale(Locale locale) {
  //   try {
  //     if (!L10n.all.contains(locale)) return;
  //     locale = locale;
  //   } catch (error) {
  //     locale = sharedPreference.locale;
  //   }
  // }

  void onAppStart() {
    try {
      final localeSh = sharedPreference.locale;
      locale = localeSh;
    } catch (error) {
      locale = const Locale('ru');
    }
  }
}
