import 'package:abah_app/config/theme.dart';
import 'package:abah_app/widgets/custom_button_with_icon.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/total_container.dart';
import 'package:flutter/material.dart';

class HorizontalView extends StatefulWidget {
  const HorizontalView({super.key});

  @override
  State<HorizontalView> createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController ratioController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  totalContainer(
                    BEDValue: 12.0, 
                    EQD2Value: 12.0, 
                    width: width
                  ),
                  const SizedBox(height: 12),
                  customTextField(
                    label: "a/B ratio", 
                    textController: ratioController, 
                    value: 12.toString()
                  )
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                          ],
                        ),
                      )
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}