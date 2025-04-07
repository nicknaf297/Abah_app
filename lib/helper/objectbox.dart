import 'package:abah_app/model/ebt.dart';
import 'package:abah_app/objectbox.g.dart';

class ObjectBox {
  late final Store _store;       //Contain actual database
  late final Box<EBT> _ebtBox;   //Entity

  ObjectBox._init(this._store) {   //Initialize entities
    _ebtBox = Box<EBT>(_store);
  }

  static Future<ObjectBox> init() async {   //Initialize ObjectBox creation
    final store = await openStore();
    return ObjectBox._init(store);
  }

  EBT? getEBT(int id) => _ebtBox.get(id);

  Stream<List<EBT>> getEBTs() => 
  _ebtBox.query().
  watch(triggerImmediately: true).
  map((query) => query.find());

  int insertEBT(EBT ebt) => _ebtBox.put(ebt);

  bool deleteEBT(int id) => _ebtBox.remove(id);
}
