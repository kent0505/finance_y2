import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_widget.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    super.key,
    required this.money,
  });

  final Money money;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xff818181),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          // SvgWidget('assets/'),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  money.title,
                  fontSize: 12,
                  fontFamily: Fonts.regular,
                  color: Colors.white,
                ),
                TextWidget(
                  money.category,
                  fontSize: 12,
                  fontFamily: Fonts.regular,
                  color: const Color(0xffBEBEBE),
                ),
              ],
            ),
          ),
          Column(
            children: [
              TextWidget(
                timestampToString(money.id),
                fontSize: 10,
                fontFamily: Fonts.regular,
                color: Colors.white,
              ),
              TextWidget(
                money.income ? '+\$${money.amount}' : '-\$${money.amount}',
                fontSize: 12,
                fontFamily: Fonts.regular,
                color: money.income
                    ? const Color(0xff00FF88)
                    : const Color(0xffFF0000),
              ),
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
