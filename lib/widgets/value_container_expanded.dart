import 'package:abah_app/config/theme.dart';
import 'package:flutter/material.dart';

Widget valueContainerExpanded({
  required String title, 
  required double value, 
  required String unit,
  required double width,
}) => Expanded(
  child: Container(
    height: 96,
    width: width * 0.36, 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: secondaryGreen
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(   
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: customTextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
          ),
          Text(
            value.toStringAsFixed(4),
            style: customTextStyle(
              bold: true,
              color: Colors.white,
              fontSize: 24
            ),
          ),
          Text(
            unit,
            style: customTextStyle(
              color: Colors.white,
              fontSize: 10
            ),
          )
        ],
      ),
      ),
  ),
);
