import 'package:abah_app/main.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatingAgent {
  void calculateEBT(EBT editEBt, WidgetRef ref) {
    final ebt = objectBox.getEBT(editEBt.id);

    if (ebt != null) {
      ebt.dosePerFraction = editEBt.dosePerFraction;
      ebt.fraction = editEBt.fraction;
      ebt.calculateValues(ref.watch(aOverBRatioProvider));
      objectBox.insertEBT(ebt);
    }
    else {
      debugPrint("EBT not found");
    }
  }

  void calculateAllEBTs(WidgetRef ref) {
    final ebtIds = objectBox.getEBTIds();

    for (int id in ebtIds) {
      final ebt = objectBox.getEBT(id);
      if (ebt != null) {
        ebt.calculateValues(ref.watch(aOverBRatioProvider));
        objectBox.insertEBT(ebt);
      }
    }

  }  

  void calculateTotalValues(WidgetRef ref) {
    final ebtIds = objectBox.getEBTIds();
    double totalBED = 0;
    double totalEQD2 = 0;

    for (int id in ebtIds) {
      final ebt = objectBox.getEBT(id);
      if (ebt != null) {
        totalBED = totalBED + ebt.bedValue;
        totalEQD2 = totalEQD2 + ebt.eqd2Value;
      }
    }

    ref.read(totalBEDProvider.notifier).state = totalBED;
    ref.read(totalEQD2Provider.notifier).state = totalEQD2;
  }
}