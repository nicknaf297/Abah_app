import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget verticalView;
  final Widget horizontalView;

  const ResponsiveLayout({
    required this.verticalView, 
    required this.horizontalView
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return verticalView;
        } 
        else {
          return horizontalView;
        }
      }
    );
  }
}