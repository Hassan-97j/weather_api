import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFFAECC2A);
//final Color secondaryColor = Colors.white;
final Color primaryTextColor = Color(0x1A4328A5);
final double titleFontSize = 24;

TextStyle setTextStyle(
    {color = Colors.blueGrey,
      double size = 22,
      weight = FontWeight.w900}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
  );
}
