import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final color_dark = Color(0xFF1C1E25);
final color_semi_dark = Color.fromARGB(220, 28, 30, 37);
final color_smooth = Color(0xFF5C5F6F);
final color_grey = Color(0xFF3E404C);
const color_white = Colors.white70;
const color_pureWhite = Colors.white;


const primaryColor = Color(0xFF142D55) ;
const secondaryColor = Color(0xFF7287A8);
const lightColor = Color(0xFF4A638B);





tStyle(
    {color = color_white,
    double fSize = 15,
    fStyle = FontStyle.normal,
    fWeight = FontWeight.w500}) {
  return TextStyle(
    color: color,
    fontSize: fSize,
    fontStyle: fStyle,
    fontWeight: fWeight,
  );
}
