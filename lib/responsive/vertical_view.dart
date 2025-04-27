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

class VerticalView extends ConsumerWidget {
  const VerticalView({super.key});

  Future<void> addEBT() async {
    EBT newEBT = EBT();
    final id = objectBox.insertEBT(newEBT);

    newEBT.name = "EBT #$id";
    objectBox.insertEBT(newEBT);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController ratioController = TextEditingController(text: ref.watch(aOverBRatioProvider.notifier).state.toString());
    final ebtListAsync = ref.watch(ebtListProvider);

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
                    onPressed: addEBT
                  )
                ],
              ),
              const SizedBox(height: 12),
              ebtListAsync.when(
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
            ],
          ),
        ),
      )
    );
  }
}