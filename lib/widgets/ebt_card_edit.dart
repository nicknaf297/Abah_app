import 'package:abah_app/config/theme.dart';
import 'package:abah_app/helper/calculating_agent.dart';
import 'package:abah_app/main.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/custom_icon_button.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/value_container_expanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EbtCardEdit extends ConsumerStatefulWidget{
  final EBT ebt;
  final double width;

  EbtCardEdit({
    super.key,
    required this.ebt,
    required this.width
  });

  @override
  ConsumerState<EbtCardEdit> createState() => _EbtCardEditState();
}

class _EbtCardEditState extends ConsumerState<EbtCardEdit> {
  final calculatingAgent = CalculatingAgent();

  late TextEditingController fractionController;
  late TextEditingController doseController;

  @override
  void initState() {
    super.initState();

    fractionController = TextEditingController(text: widget.ebt.fraction.toStringAsFixed(2));
    doseController = TextEditingController(text: widget.ebt.dosePerFraction.toStringAsFixed(2));

    fractionController.addListener(updateValue);
    doseController.addListener(updateValue);
  }

  @override
  void dispose() {
    super.dispose();
    fractionController.dispose();
    doseController.dispose();
  }

  void deleteEBT(int id) {
    objectBox.deleteEBT(id);
  }

  void updateValue() {
    final fraction = double.tryParse(fractionController.text) ?? 0;
    final dose = double.tryParse(doseController.text) ?? 0;

    widget.ebt.fraction = fraction;
    widget.ebt.dosePerFraction = dose;

    calculatingAgent.calculateEBT(widget.ebt, ref);
    calculatingAgent.calculateAllEBTs(ref);
    calculatingAgent.calculateTotalValues(ref);
  }

  @override
  Widget build(BuildContext context) {
    final ebt = widget.ebt;
    final width = widget.width;

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
                  deleteEBT(ebt.id);
                }
              ),
              const SizedBox(width: 12),
              customIconButton(
                icon: const Icon(Icons.check), 
                color: primaryGreen,
                onPressed: () {
                  ref.read(ebtCardEditProvider.notifier).set(ebt.id, false);
                }
              )
            ],
          ),
          const SizedBox(height: 4),
          customTextField(
            label: "Number of fraction, n", 
            textController: fractionController, 
          ),
          customTextField(
            label: "Dose per Fraction", 
            textController: doseController, 
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
}