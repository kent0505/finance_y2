import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';
import '../utils.dart';
import 'prefs.dart';

String boxName = 'shablonbox';
String keyName = 'modelsList';
List<Money> modelsList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    await getData();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(MoneyAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMoney() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    modelsList = data.cast<Money>();
    logger(modelsList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMoney() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, modelsList);
    modelsList = await box.get(keyName);
  } catch (e) {
    logger(e);
  }
}
