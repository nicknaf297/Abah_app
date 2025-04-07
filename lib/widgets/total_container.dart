import 'package:abah_app/config/theme.dart';
import 'package:abah_app/widgets/value_container_expanded.dart';
import 'package:flutter/material.dart';

Widget totalContainer ({
  required double BEDValue,
  required double EQD2Value,
  required double width
}) => Container(
  height: 192,
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: primaryGreen
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(   
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total EBT",
          style: customTextStyle(
            bold: true,
            color: Colors.white,
            fontSize: 28
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            valueContainerExpanded(
              title: "BED", 
              value: BEDValue, 
              unit: "[Gya/B]",
              width: width
            ),
            const SizedBox(width: 16),
            valueContainerExpanded(
              title: "EQD2", 
              value: EQD2Value, 
              unit: "[Gy]",
              width: width
            )
          ],
        )
      ],
    ),
    ),
  );