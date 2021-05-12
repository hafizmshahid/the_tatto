import 'package:flutter/material.dart';


final Color kGreenColor = HexColor("#00d14d");
final Color kGryBorderColor = HexColor("#707070");
final Color kAppPrimaryColor = HexColor("#000000");
final Color kPrimaryTextColor = HexColor("#ffffff");



class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String _hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (_hexColor.length == 6) {
      _hexColor = "FF$_hexColor";
    }
    return int.parse(_hexColor, radix: 16);
  }
}