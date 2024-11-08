import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';
import '../utils.dart';
import 'prefs.dart';

String boxName = 'finance_y2_box';
String keyName = 'moneyList';
List<Money> moneyList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    await getData();
    // await Hive.deleteBoxFromDisk(boxName);
    Hive.registerAdapter(MoneyAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMoney() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    moneyList = data.cast<Money>();
    logger(moneyList.length);
    calculateMoney();
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMoney() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, moneyList);
    moneyList = await box.get(keyName);
    calculateMoney();
  } catch (e) {
    logger(e);
  }
}
