// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:allah_names/src/services/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColors {
  static Color dangerColor = const Color(0xFFef4444);
  static Color danger100 = const Color(0xFFfef2f2);
  static Color successColor = const Color(0xFF68a835);
  static Color splashColor = const Color.fromARGB(15, 154, 151, 151);
  static Color splashColorMButton = const Color.fromARGB(24, 158, 158, 158);
  static Color highlightColor = const Color.fromARGB(15, 119, 117, 117);
  static Color gray100 = const Color(0xffF6F6F6);
  static Color gray200 = const Color(0xFFECECEC);
  static Color gray300 = const Color(0xffE2E2E2);
  static Color gray600 = const Color(0xffA4A4A4);
  static Color gray800 = const Color(0xff7C7C7C);
  static Color gray900 = const Color(0xff676767);
  static Color abyssColor = const Color(0xFF0B1632);
  static Color inactiveColor = const Color(0xffE2E8F0);
  static Color gray1000 = const Color(0xff535353);
  static Color grayText = const Color.fromARGB(255, 144, 144, 144);
  static Color lightPrimaryColor = const Color(0xff6bbed0);
  static Color lightPrimaryColorDark = const Color(0xff7c46bf);
  static Color scaffoldBackgroundColorLight = const Color.fromARGB(255, 249, 252, 255);
  static Color standartColor(BuildContext context) =>
      !Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
          ? const Color(0xffffffff)
          : const Color(0x00000000);
  static Color scaffoldBackgroundColor(BuildContext context) =>
      !Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
          ? const Color(0xfff1f4f8)
          : const Color(0xff14143a);
  static Color primaryColor(BuildContext context) =>
      !Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
          ? const Color(0xff6bbed0)
          : const Color(0xff7c46bf);
  static Color iconColor(BuildContext context) => Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
      ? const Color(0xffffffff)
      : const Color(0xff8c57636c);
  static Color lineColor(BuildContext context) => Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
      ? const Color(0xff22282f)
      : const Color(0xffe0e3e7);
  static Color containerColor(BuildContext context) =>
      Provider.of<ThemeProviderNotifier>(context, listen: false).isDarkMode
          ? const Color(0xff22214e)
          : const Color(0xfffafbfc);
}
