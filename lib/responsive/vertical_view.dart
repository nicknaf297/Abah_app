import 'package:abah_app/config/theme.dart';
import 'package:abah_app/widgets/custom_button_with_icon.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/total_container.dart';
import 'package:flutter/material.dart';

class VerticalView extends StatefulWidget {
  const VerticalView({super.key});

  @override
  State<VerticalView> createState() => _VerticalViewState();
}

class _VerticalViewState extends State<VerticalView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController ratioController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              totalContainer(
                BEDValue: 1777.89, 
                EQD2Value: 1179.99, 
                width: width
              ),
              const SizedBox(height: 12),
              customTextField(
                label: "a/b ratio", 
                textController: ratioController, 
                value: 12.toString()
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "List of EBTs",
                      style: customTextStyle(
                        bold: true,
                        fontSize: 24
                      ),
                    ),
                  ),
                  customButtonWithIcon(
                    label: "Add EBT", 
                    icon: const Icon(Icons.add), 
                    onPressed: () {}
                  )
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
            ],
          ),
        ),
      )
    );
  }
}