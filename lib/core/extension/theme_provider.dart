import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/constants/colors_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: ColorConstants.instance.blueRibbon,
  onPrimary: ColorConstants.instance.blueRibbon,
  background: ColorConstants.instance.white,
  onBackground: ColorConstants.instance.white,
  secondary: ColorConstants.instance.gray,
  onSecondary: ColorConstants.instance.gray,
  error: ColorConstants.instance.gray,
  onError: ColorConstants.instance.gray,
  surface: ColorConstants.instance.gray,
  onSurface: ColorConstants.instance.gray,
);

String fontFamily = GoogleFonts.montserrat().fontFamily!;

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: _customColorScheme.background,
    primaryColor: _customColorScheme.primary,
    focusColor: _customColorScheme.secondary,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 18.sp,
        color: ColorConstants.instance.tundora,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.tundora,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.gray,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 12.sp,
        color: Colors.red,
        fontWeight: FontWeight.w100,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 11.sp,
        color: ColorConstants.instance.gray,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: _customColorScheme.background,
    primaryColor: _customColorScheme.primary,
    focusColor: _customColorScheme.secondary,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 18.sp,
        color: ColorConstants.instance.gray,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.tundora,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.gray,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.blueRibbon,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 11.sp,
        color: ColorConstants.instance.gray,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}