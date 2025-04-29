import 'package:abah_app/config/theme.dart';
import 'package:abah_app/helper/calculating_agent.dart';
import 'package:abah_app/main.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/custom_button_with_icon.dart';
import 'package:abah_app/widgets/custom_textfield.dart';
import 'package:abah_app/widgets/ebt_card.dart';
import 'package:abah_app/widgets/total_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HorizontalView extends ConsumerStatefulWidget {
  const HorizontalView({super.key});
  
  @override
  ConsumerState<HorizontalView> createState() => _HorizontalViewState();
}

class _HorizontalViewState extends ConsumerState<HorizontalView>{
  final calculatingAgent = CalculatingAgent();

  late TextEditingController ratioController;

  @override
  void initState() {
    super.initState();
    ratioController = TextEditingController(
      text: ref.read(aOverBRatioProvider.notifier).state.toString()
    );
    ratioController.addListener(updateValue);
  }

  @override
  void dispose() {
    ratioController.dispose();
    super.dispose();
  }

  void updateValue() {
    final ratio = double.tryParse(ratioController.text) ?? 0;
    ref.read(aOverBRatioProvider.notifier).state = ratio;

    calculatingAgent.calculateAllEBTs(ref);
    calculatingAgent.calculateTotalValues(ref);
  }

  Future<void> addEBT() async {
    EBT newEBT = EBT();
    final id = objectBox.insertEBT(newEBT);

    newEBT.name = "EBT #$id";
    objectBox.insertEBT(newEBT);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final ebtListAsync = ref.watch(ebtListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Row(
          children: [
            Expanded(
              child: CustomScrollView(   //Expanded cannot be in Scroll
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        totalContainer(
                          BEDValue: ref.watch(totalBEDProvider.notifier).state, 
                          EQD2Value: ref.watch(totalEQD2Provider.notifier).state, 
                          width: width
                        ),
                        const SizedBox(height: 12),
                        customTextField(
                          label: "a/B ratio", 
                          textController: ratioController, 
                        )
                      ],
                    ),
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
                    child: ebtListAsync.when(
                      data: (ebts) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: ebts.length,
                        itemBuilder: (context, index) {
                          final ebt = ebts[index];
                          return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            child: EbtCard(
                              ebt: ebt, 
                              width: width
                            )
                          );
                        }
                      ), 
                      error: (stack, e) => Center(child: Text("Error $e")), 
                      loading: () => const Center(child: CircularProgressIndicator())
                    ),
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