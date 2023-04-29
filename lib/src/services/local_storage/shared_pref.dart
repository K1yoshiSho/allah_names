import 'package:allah_names/src/services/local_storage/preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreference = SharedPreferenceHelper();

class SharedPreferenceHelper {
  late SharedPreferences _sharedPreference;

  initSharedPreferences() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _sharedPreference;

  Future<void> clearAll() async {
    await _sharedPreference.clear();
  }

  Future setDarkMode(bool value) async => await _sharedPreference.setBool(Preferences.kAppTheme, value);
  bool? isDarkMode() => _sharedPreference.getBool(Preferences.kAppTheme);

  Locale get locale => Locale(_sharedPreference.getString(Preferences.kLocale) ?? 'ru');
  Future setLocale(Locale value) async => await _sharedPreference.setString(Preferences.kLocale, value.languageCode);
}
