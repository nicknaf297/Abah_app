import 'package:abah_app/config/theme.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/responsive/horizontal_view.dart';
import 'package:abah_app/responsive/responsive_layout.dart';
import 'package:abah_app/responsive/vertical_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HdrPage extends StatefulWidget {
  HdrPage({super.key});

  @override
  State<HdrPage> createState() => _HdrPageState();
}

class _HdrPageState extends State<HdrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RT",
          style: customTextStyle(
            bold: true, 
            color: Colors.white,
            fontSize: 32
          ),
        ),
      ),
      body: ResponsiveLayout(
        verticalView: VerticalView(), 
        horizontalView: HorizontalView()
      )
    );
  }
}