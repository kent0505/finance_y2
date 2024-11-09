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

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
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
    if (money.income) {
      totalIncomes += money.amount;
    } else {
      totalExpenses += money.amount;
    }
  }
}

String getPreviousMonthName() {
  DateTime now = DateTime.now();
  DateTime previousMonth = DateTime(now.year, now.month - 1);
  return DateFormat('MMMM').format(previousMonth);
}

// double comparePreviousMonthIncomes() {
//   List<Money> currentMonthList = [];
//   List<Money> lastMonthList = [];
//   DateTime now = DateTime.now();
//   int incomes1 = 0;
//   int expenses1 = 0;
//   int incomes2 = 0;
//   int expenses2 = 0;

//   for (Money money in moneyList) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
//     if (date.month == now.month) currentMonthList.add(money);
//     if (date.month - 1 == now.month - 1) lastMonthList.add(money);
//   }

//   for (Money money in currentMonthList) {
//     if (money.income) {
//       incomes1 += money.amount;
//     } else {
//       expenses1 += money.amount;
//     }
//   }

//   for (Money money in lastMonthList) {
//     if (money.income) {
//       incomes2 += money.amount;
//     } else {
//       expenses2 += money.amount;
//     }
//   }

//   if (incomes2 - expenses2 == 0) {
//     return 0;
//   } else {
//     return (incomes1 - expenses1 / incomes2 - expenses2) * 100;
//   }
// }

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
    if (money.income) {
      incomes1 += money.amount;
    } else {
      expenses1 += money.amount;
    }
  }
  for (Money money in lastMonthList) {
    if (money.income) {
      incomes2 += money.amount;
    } else {
      expenses2 += money.amount;
    }
  }
  int netIncome1 = incomes1 - expenses1;
  int netIncome2 = incomes2 - expenses2;
  if (netIncome2 == 0) return '0%';
  final total = ((netIncome1 - netIncome2) / netIncome2) * 100;
  return '${total.toStringAsFixed(2)}%';
}

String getCurrentMonth(int id) {
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
