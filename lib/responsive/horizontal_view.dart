import 'package:abah_app/config/theme.dart';
import 'package:abah_app/main.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/custom_button_with_icon.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/ebt_card.dart';
import 'package:abah_app/widgets/total_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HorizontalView extends ConsumerWidget {
  const HorizontalView({super.key});

  Future<void> addEBT() async {
    EBT newEBT = EBT();
    final id = objectBox.insertEBT(newEBT);

    newEBT.name = "EBT #$id";
    objectBox.insertEBT(newEBT);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController ratioController = TextEditingController();
    final ebtListAsync = ref.watch(ebtListProvider);

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
                        onPressed: addEBT
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ebtListAsync.when(
                        data: (ebts) => Column(
                          children: ebts.map((ebt) => Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            child: EbtCard(
                              ebt: ebt, 
                              width: width
                              ),
                            )
                          ).toList()
                        ), 
                        error: (stack, e) => Center(child: Text("Error $e")), 
                        loading: () => const Center(child: CircularProgressIndicator())
                      ),
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