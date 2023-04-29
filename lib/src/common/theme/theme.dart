import 'package:allah_names/src/common/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    splashColor: AppColors.splashColor,
    splashFactory: InkRipple.splashFactory,
    primaryColor: AppColors.primaryColor,
    unselectedWidgetColor: AppColors.gray300,
    primaryColorLight: AppColors.gray200,
    listTileTheme: ListTileThemeData(
      selectedColor: Colors.white,
      selectedTileColor: AppColors.accent100,
      horizontalTitleGap: 5,
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.gray100,
      modalBackgroundColor: Colors.white,
      modalElevation: 0,
      elevation: 0,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.abyssColor, size: 20),
    textTheme: TextTheme(
      labelLarge: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      labelMedium: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      labelSmall: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      titleLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: AppColors.abyssColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.abyssColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: AppColors.abyssColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.abyssColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.abyssColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.abyssColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.gray200,
          width: 1.5,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.gray300,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.gray200,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.dangerColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.dangerColor,
          width: 1.5,
        ),
      ),
      labelStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.abyssColor,
      ),
      hintStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.grayText,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      dialHandColor: AppColors.primaryColor,
      hourMinuteTextColor: AppColors.primaryColor,
      backgroundColor: const Color(0xffF1F8EC),
      dayPeriodTextColor: AppColors.primaryColor,
      dialBackgroundColor: AppColors.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: const Color(0xFF3C4A7C).withOpacity(0.40),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: Colors.transparent,
      color: AppColors.primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.abyssColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.abyssColor,
      ),
      iconTheme: IconThemeData(color: AppColors.abyssColor, size: 20),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    ),
    colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primaryColor).copyWith(background: Colors.white),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return AppColors.primaryColor;
        return AppColors.gray300;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return AppColors.primaryColor;
        return AppColors.gray300;
      }),
      trackColor: MaterialStateProperty.all(const Color(0xFFE0E2D8)),
    ).copyWith(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.gray300;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent500;
        }
        return AppColors.gray300;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.gray300;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent500;
        }
        return AppColors.gray300;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.accent500),
    ).copyWith(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.gray300;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent500;
        }
        return AppColors.gray300;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        return AppColors.accent500;
      }),
      overlayColor: MaterialStateProperty.all(AppColors.splashColor),
      side: BorderSide(
        color: AppColors.gray300,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      checkColor: MaterialStateProperty.all(Colors.white),
    ));

// final ThemeData DarkTheme = ThemeData(
//   useMaterial3: true,
//   scaffoldBackgroundColor: Colors.white,
//   brightness: Brightness.light,
//   primaryColor: AppColors.accent600,
//   applyElevationOverlayColor: false,
//   highlightColor: AppColors.splashColor,
//   listTileTheme: ListTileThemeData(
//     selectedColor: Colors.white,
//     selectedTileColor: AppColors.primaryColor.withOpacity(0.1),
//     tileColor: AppColors.primaryColor.withOpacity(0.1),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       elevation: 0,
//       backgroundColor: AppColors.accent500,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       textStyle: const TextStyle(
//         fontFamily: "Inter",
//         fontWeight: FontWeight.w600,
//         fontSize: 16,
//       ),
//     ),
//   ),
//   primaryColorLight: AppColors.gray200,
//   iconTheme: IconThemeData(color: AppColors.abyssColor, size: 20),
//   textTheme: TextTheme(
//     labelLarge: const TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//       color: Color.fromARGB(255, 120, 128, 134),
//     ),
//     labelMedium: const TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
//       color: Color.fromARGB(255, 120, 128, 134),
//     ),
//     labelSmall: const TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 10,
//       color: Color.fromARGB(255, 120, 128, 134),
//     ),
//     titleLarge: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w700,
//       fontSize: 22,
//       color: AppColors.abyssColor,
//     ),
//     titleMedium: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w600,
//       fontSize: 20,
//       color: AppColors.abyssColor,
//     ),
//     titleSmall: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w600,
//       fontSize: 18,
//       color: AppColors.abyssColor,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w500,
//       fontSize: 16,
//       color: AppColors.abyssColor,
//     ),
//     bodyLarge: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w600,
//       fontSize: 16,
//       color: AppColors.abyssColor,
//     ),
//     bodySmall: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//       color: AppColors.abyssColor,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     contentPadding: const EdgeInsets.symmetric(
//       horizontal: 15,
//       vertical: 20,
//     ),
//     filled: true,
//     fillColor: Colors.white,
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: AppColors.gray200,
//         width: 1.5,
//       ),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: AppColors.gray300,
//         width: 1.5,
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: AppColors.primaryColor,
//         width: 1.5,
//       ),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: AppColors.dangerColor),
//     ),
//     labelStyle: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//       color: AppColors.abyssColor,
//     ),
//     hintStyle: TextStyle(
//       fontFamily: "Inter",
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//       color: AppColors.grayText,
//     ),
//   ),
//   timePickerTheme: TimePickerThemeData(
//     dialHandColor: AppColors.primaryColor,
//     hourMinuteTextColor: AppColors.primaryColor,
//     backgroundColor: const Color(0xffF1F8EC),
//     dayPeriodTextColor: AppColors.primaryColor,
//     dialBackgroundColor: AppColors.primaryColor.withOpacity(0.1),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   ),
//   textSelectionTheme: TextSelectionThemeData(
//     cursorColor: AppColors.primaryColor,
//     selectionColor: const Color(0xFF3C4A7C).withOpacity(0.40),
//   ),
//   progressIndicatorTheme: ProgressIndicatorThemeData(
//     circularTrackColor: Colors.transparent,
//     color: AppColors.primaryColor,
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: AppColors.primaryColor,
//   ),
//   appBarTheme: AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     centerTitle: true,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       fontFamily: 'Inter',
//       fontWeight: FontWeight.w500,
//       fontSize: 16,
//       color: AppColors.abyssColor,
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light,
//       statusBarColor: AppColors.abyssColor,
//     ),
//     iconTheme: IconThemeData(color: AppColors.abyssColor, size: 20),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor: MaterialStateProperty.all(AppColors.primaryColor),
//   ),
//   switchTheme: SwitchThemeData(
//     overlayColor: MaterialStateProperty.resolveWith((states) {
//       if (states.contains(MaterialState.selected)) return AppColors.primaryColor;
//       return AppColors.gray300;
//     }),
//     thumbColor: MaterialStateProperty.resolveWith((states) {
//       if (states.contains(MaterialState.selected)) return AppColors.primaryColor;
//       return AppColors.gray300;
//     }),
//     trackColor: MaterialStateProperty.all(const Color(0xFFE0E2D8)),
//   ),
//   checkboxTheme: CheckboxThemeData(
//     fillColor: MaterialStateProperty.resolveWith((states) {
//       return const Color(0xFFE0E2D8);
//     }),
//   ),
//   tabBarTheme: const TabBarTheme(
//     indicatorSize: TabBarIndicatorSize.tab,
//     dividerColor: Colors.transparent,
//   ),
//   colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primaryColor).copyWith(background: Colors.white),
// );
