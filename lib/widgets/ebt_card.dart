import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/provider.dart';
import 'package:abah_app/widgets/ebt_card_edit.dart';
import 'package:abah_app/widgets/ebt_card_minimized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EbtCard extends ConsumerWidget{
  final EBT ebt;
  final double width;

  const EbtCard({
    super.key, 
    required this.ebt,
    required this.width
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editing = ref.watch(ebtCardEditProvider);

    return editing
      ? ebtCardEdit(
        ebt: ebt,
        width: width
      )
      : ebtCardMinimized(
        ebt: ebt
      );
  }
}