import 'package:abah_app/config/theme.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/custom_icon_button.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/value_container_expanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fractionController = TextEditingController();
final doseController = TextEditingController();

Widget ebtCardEdit ({
  required EBT ebt,
  required double width
}) => Consumer(
  builder: (context, ref, child) {
    return Container(
      height: 337,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: primaryGreen,
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ebt.name,
                  style: customTextStyle(
                    bold: true,
                    fontSize: 24
                  ),
                )
              ),
              customIconButton(
                icon: const Icon(Icons.delete), 
                color: red,
                onPressed: () {
                  ref.read(ebtCardEditProvider.notifier).state = false;
                }
              ),
              const SizedBox(width: 12),
              customIconButton(
                icon: const Icon(Icons.check), 
                color: primaryGreen,
                onPressed: () {
                  ref.read(ebtCardEditProvider.notifier).state = false;
                }
              )
            ],
          ),
          const SizedBox(height: 4),
          customTextField(
            label: "Number of fraction, n", 
            textController: fractionController, 
            value: 12.toString()
          ),
          customTextField(
            label: "Dose per Fraction", 
            textController: doseController, 
            value: 12.toString()
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: valueContainerExpanded(
                  title: "BED",
                  value: ebt.bedValue,
                  unit: "[Gya/B]",
                  width: width
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: valueContainerExpanded(
                    title: "EQD2",
                    value: ebt.eqd2Value,
                    unit: "[Gya]",
                    width: width
                )
              ),
            ],
          )
        ],
      ),
    );
  }
);