import 'package:flutter_riverpod/flutter_riverpod.dart';

//Handle state for cards
final ebtCardEditProvider = StateProvider<bool>((ref) => false);

final aOverBRatioProvider = StateProvider<double>((ref) => 0.0);
final totalBEDProvider = StateProvider<double>((ref) => 0.0);
final totalEQD2Provider = StateProvider<double>((ref) => 0.0);