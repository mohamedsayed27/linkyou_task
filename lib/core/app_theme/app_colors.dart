import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const primaryColor = Color(0xff010058);
  static const whiteColor = Color(0xffFFFFFF);
  static const appBarColor = Color(0xffDDE8F3);
  static const scaffoldBackgroundColor = Color(0xffE2E9F4);
  static const splashBackgroundColor = Color(0xff353A5B);
  static const userContainerBorderColor = Color(0xffC7C7CC);
  static const greyColor71 = Color(0xff717171);
  static const darkGreyTextColor = Color(0xff1D1E20);
  static Color shimmerHighLightColor = Colors.grey[200]!;
  static Color shimmerBaseColor = Colors.grey[300]!;
}