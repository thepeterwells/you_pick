import 'package:flutter/material.dart';

class HexColor extends MaterialColor {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor), {
    50:  Color(_getColorFromHex(hexColor)),
    100: Color(_getColorFromHex(hexColor)),
    200: Color(_getColorFromHex(hexColor)),
    300: Color(_getColorFromHex(hexColor)),
    400: Color(_getColorFromHex(hexColor)),
    500: Color(_getColorFromHex(hexColor)),
    600: Color(_getColorFromHex(hexColor)),
    700: Color(_getColorFromHex(hexColor)),
    800: Color(_getColorFromHex(hexColor)),
    900: Color(_getColorFromHex(hexColor)),
  });
}

class AppTheme {
  static Color primaryColor = HexColor("#494747");
  static Color primaryLightColor = HexColor("#747272");
  static Color primaryDarkColor = HexColor("#222020");
  static Color secondaryColor = HexColor("#b6bc94");
  static Color secondaryLightColor = HexColor("#e8eec5");
  static Color secondaryDarkColor = HexColor("#868c66");
  static Color primaryTextColor = HexColor("#ffffff");
  static Color secondaryTextColor = HexColor("#2a3f13");
}