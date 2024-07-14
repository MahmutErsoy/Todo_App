import 'package:flutter/material.dart';

class ColorConstants {
  static final ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;

  Color blueRibbon = const Color(0xff006AFF);
  Color jungleGreen = const Color(0xff25AE87);
  Color gray = const Color(0xff908e8e);

  Color white = const Color(0xffFFFFFF);
  Color portGore = const Color(0xff1F1A3D);
  Color cornflowerBlue = const Color(0xff6688FF);
  Color dustyGray = const Color(0xff999999);
  Color tundora = const Color(0xff404040);
  Color whisper = const Color(0xffF5F6FA);
  Color alto = const Color(0xffD9D9D9);

  Color  green = const Color(0xff3396a1);
  Color  tabText = const Color(0xff86afb7);
  Color  appbar = const Color(0xffcae2e3);
  Color  primarySwatch = const Color(0xff1C6BA4);

  ColorConstants._init();
}