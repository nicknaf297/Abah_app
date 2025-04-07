import 'package:flutter/material.dart';

Widget customIconButton ({
  required Icon icon, 
  required Color color,
  required void Function() onPressed
}) => SizedBox(
  height: 34,
  width: 34,
  child: IconButton.filled(
    iconSize: 18,
    icon: icon,
    style: IconButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white
    ),
    onPressed: onPressed, 
  ),
);