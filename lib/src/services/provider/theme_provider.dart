import 'package:allah_names/src/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProviderNotifier extends ChangeNotifier {
  ThemeMode themeMode = sharedPreference.isDarkMode() == null
      ? ThemeMode.system
      : (sharedPreference.isDarkMode()! ? ThemeMode.dark : ThemeMode.light);

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    });
    sharedPreference.setDarkMode(isOn ? true : false);
  }
}
