import 'package:abah_app/config/theme.dart';
import 'package:flutter/material.dart';

Widget customButtonWithIcon ({
  required String label,
  required Icon icon,
  required void Function() onPressed
}) => FilledButton.icon(
  onPressed: onPressed, 
  label: Text(label),
  icon: icon,
  style: const ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(primaryGreen),
    foregroundColor: WidgetStatePropertyAll(Colors.white)
  ),
);