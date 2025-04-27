import 'package:abah_app/helper/objectbox.dart';
import 'package:abah_app/model/ebt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Handle state for cards -- keep track of card is expanded or not
class EBTCardEditProvider extends StateNotifier<Map<int, bool>> {
    EBTCardEditProvider() : super({});

    void toggle(int id) {
        bool value = state[id] ?? false;  //get bool of state
        state = {
            ...state,    //copy state
            id: !value   //set the bool of state with the id
        };
    }

    void set(int id, bool value) {
        state = {
            ...state,    //copy state
            id: value    //set the bool of state with the id
        };
    }

    bool isExpanded(int id) {
        return state[id] ?? false;
    }
}

//Track ObjectBox itself -- the content is a placeholder
final objectBoxProvider = Provider<ObjectBox>((ref) {
  throw UnimplementedError("Object Box not initialized");
});

//Track the list of EBTs
final ebtListProvider = StreamProvider<List<EBT>>((ref) {
  final objectBox = ref.read(objectBoxProvider);
  return objectBox.getEBTs();
});

//Card Edit Provider -- track expansion of cards
final ebtCardEditProvider = StateNotifierProvider<EBTCardEditProvider, Map<int, bool>> (
        (ref) => EBTCardEditProvider()
);

final aOverBRatioProvider = StateProvider<double>((ref) => 12.0);
final totalBEDProvider = StateProvider<double>((ref) => 0.0);
final totalEQD2Provider = StateProvider<double>((ref) => 0.0);