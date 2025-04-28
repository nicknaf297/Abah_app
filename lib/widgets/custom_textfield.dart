import 'package:abah_app/config/theme.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required String label,
  required TextEditingController textController, 
}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: customTextStyle(
              fontSize: 14,
              color: primaryGreen
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: TextFormField(
              decoration: customInputDecoration(),
              controller: textController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          )
        ],
      );