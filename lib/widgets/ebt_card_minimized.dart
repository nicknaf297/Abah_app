import 'package:abah_app/config/theme.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/custom_icon_button.dart';
import 'package:abah_app/widgets/value_container_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget ebtCardMinimized ({
  required EBT ebt,
}) => Consumer(
  builder: (context, ref, child) {
    return Container(
      height: 193,
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
                icon: const Icon(Icons.edit), 
                color: primaryGreen,
                onPressed: () {
                  ref.read(ebtCardEditProvider.notifier).set(ebt.id, true);
                }
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Number of fraction:  ${ebt.fraction.toStringAsFixed(2)}",
            style: customTextStyle(
              fontSize: 12
            ),
          ),
          Text(
            "Dose per Fraction:  ${ebt.dosePerFraction.toStringAsFixed(2)}",
            style: customTextStyle(
              fontSize: 12
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: valueContainerMinimized(
                  title: "BED", 
                  value: ebt.bedValue
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: valueContainerMinimized(
                  title: "EQD2", 
                  value: ebt.eqd2Value
                )
              )
            ],
          )
        ],
      ),
    );
  }
);