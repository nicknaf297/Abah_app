import 'package:abah_app/config/theme.dart';
import 'package:flutter/material.dart';

Widget valueContainerMinimized({
  required String title, 
  required double value, 
}) => Container(
  height: 68,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: secondaryGreen
  ),
  child: Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    child: Column(   
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: customTextStyle(
            color: Colors.white,
            fontSize: 13
          ),
        ),
        Expanded(
          child: Text(
            value.toStringAsFixed(2),
            style: customTextStyle(
                bold: true,
                color: Colors.white,
                fontSize: 20
            ),
          ),
        ),
      ],
    ),
    ),
);
