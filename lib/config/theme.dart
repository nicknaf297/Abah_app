import 'package:flutter/material.dart';

const Color primaryGreen = Color(0xFF118B50);
const Color secondaryGreen = Color(0xFF5DB996);
const Color red = Color(0xFFC40000);


TextStyle customTextStyle ({bool bold = false,  Color color = Colors.black, double fontSize = 24 }) => TextStyle(
  fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
  color: color,
  fontSize: fontSize,
  fontFamily: 'SourceSans3'
);

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: primaryGreen,
  iconTheme: IconThemeData(color: Colors.white),
  toolbarHeight: 72,
);

InputDecoration customInputDecoration ({String text = ""})
=> InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintText: text,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: primaryGreen),
    borderRadius: BorderRadius.all(Radius.circular(12))
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: primaryGreen),
    borderRadius: BorderRadius.all(Radius.circular(12))
  ),
);

ThemeData customTheme = ThemeData(
  appBarTheme: appBarTheme
);