import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Money {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool income;

  Money({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.income,
  });
}

class MoneyAdapter extends TypeAdapter<Money> {
  @override
  final typeId = 0;

  @override
  Money read(BinaryReader reader) {
    return Money(
      id: reader.read(),
      title: reader.read(),
      amount: reader.read(),
      category: reader.read(),
      income: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Money obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.amount);
    writer.write(obj.category);
    writer.write(obj.income);
  }
}

final defaultMoney = Money(
  id: 0,
  title: '',
  amount: 0,
  category: '',
  income: true,
);

// List<Money> testMoneyList = [
//   Money(
//     id: getCurrentTimestamp(),
//     title: 'Aaa',
//     amount: 200,
//     category: 'Food',
//     income: false,
//   ),
//   Money(
//     id: getCurrentTimestamp(),
//     title: 'Bbb',
//     amount: 350,
//     category: 'Passive',
//     income: true,
//   ),
//   Money(
//     id: getCurrentTimestamp() - 2700000, // last month
//     title: 'Ccc',
//     amount: 400,
//     category: 'Food',
//     income: false,
//   ),
//   Money(
//     id: getCurrentTimestamp() - 2700000, // last month
//     title: 'Ddd',
//     amount: 600,
//     category: 'Food',
//     income: true,
//   ),
//   Money(
//     id: getCurrentTimestamp() - 2700000 * 2, // 2 month ago
//     title: 'Ccc',
//     amount: 200,
//     category: 'Food',
//     income: false,
//   ),
//   Money(
//     id: getCurrentTimestamp() - 2700000 * 2, // 2 month ago
//     title: 'Ddd',
//     amount: 300,
//     category: 'Food',
//     income: true,
//   ),
//   Money(
//     id: 1732075653,
//     title: 'Aaaaasda',
//     amount: 350,
//     category: 'Food',
//     income: false,
//   ),
//   Money(
//     id: 1732075653,
//     title: 'Aaaaasda',
//     amount: 400,
//     category: 'Passive',
//     income: true,
//   ),
// ];
