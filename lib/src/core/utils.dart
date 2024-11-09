import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'db/db.dart';
import 'models/money.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to Aug 26, 2024
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMM d, y').format(date);
  } catch (e) {
    return 'Error';
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}

String getCatSvg(String cat) {
  if (cat == 'Investment') return 'assets/cat1.svg';
  if (cat == 'Food') return 'assets/cat2.svg';
  if (cat == 'Transport') return 'assets/cat3.svg';
  if (cat == 'Procurement') return 'assets/cat4.svg';
  if (cat == 'Rest') return 'assets/cat5.svg';
  if (cat == 'Passive') return 'assets/cat6.svg';
  if (cat == 'Salary') return 'assets/cat7.svg';
  if (cat == 'Rent') return 'assets/cat3.svg';
  if (cat == 'Business') return 'assets/cat8.svg';
  if (cat == 'Freelance') return 'assets/cat9.svg';
  if (cat == 'Investment ') return 'assets/cat10.svg';
  if (cat == 'Dividends') return 'assets/cat11.svg';
  if (cat == 'Royalty') return 'assets/cat12.svg';
  return 'assets/cat1.svg';
}

int totalIncomes = 0;
int totalExpenses = 0;

void calculateMoney() {
  totalIncomes = 0;
  totalExpenses = 0;
  for (Money money in moneyList) {
    money.income ? totalIncomes += money.amount : totalExpenses += money.amount;
  }
}

String comparePreviousMonthIncomes() {
  List<Money> currentMonthList = [];
  List<Money> lastMonthList = [];
  DateTime now = DateTime.now();
  int incomes1 = 0;
  int expenses1 = 0;
  int incomes2 = 0;
  int expenses2 = 0;
  for (Money money in moneyList) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
    if (date.month == now.month && date.year == now.year) {
      currentMonthList.add(money);
    }
    DateTime previousMonth = DateTime(now.year, now.month - 1);
    if (date.month == previousMonth.month && date.year == previousMonth.year) {
      lastMonthList.add(money);
    }
  }
  for (Money money in currentMonthList) {
    money.income ? incomes1 += money.amount : expenses1 += money.amount;
  }
  for (Money money in lastMonthList) {
    money.income ? incomes2 += money.amount : expenses2 += money.amount;
  }
  int netIncome1 = incomes1 - expenses1;
  int netIncome2 = incomes2 - expenses2;
  if (netIncome2 == 0) return '0%';
  final total = ((netIncome1 - netIncome2) / netIncome2) * 100;
  return '${total.toStringAsFixed(2)}%';
}

String getPreviousMonthName() {
  DateTime now = DateTime.now();
  DateTime previousMonth = DateTime(now.year, now.month - 1);
  return DateFormat('MMMM').format(previousMonth);
}

String getMonthName(int id) {
  const monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  DateTime now = DateTime.now();
  return monthNames[now.month - id];
}

double getMonthIncome(int id) {
  List<Money> sortedList = [];
  DateTime now = DateTime.now();
  int incomes = 0;
  int expenses = 0;
  for (Money money in moneyList) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
    if (date.month == now.month - id && date.year == now.year) {
      sortedList.add(money);
    }
  }
  for (Money money in sortedList) {
    money.income ? incomes += money.amount : expenses += money.amount;
  }
  return (incomes - expenses).toDouble();
}

List<double> normalizeToMax70() {
  List<double> values = [
    getMonthIncome(0),
    getMonthIncome(1),
    getMonthIncome(2),
    getMonthIncome(3),
    getMonthIncome(4),
  ];
  double maxValue = values.reduce((a, b) => a > b ? a : b);
  if (maxValue == 0) return List.filled(values.length, 0);
  double scale = 70 / maxValue;
  return values.map((value) => (value * scale)).toList();
}
