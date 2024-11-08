import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/extra_model.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    super.key,
    required this.money,
  });

  final Money money;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xff818181),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CuperButton(
          onPressed: () {
            context.push(
              '/money',
              extra: ExtraModel(
                add: false,
                money: money,
              ),
            );
          },
          minSize: 40,
          child: Row(
            children: [
              SizedBox(
                width: 54,
                child: Center(
                  child: SvgWidget(
                    getCatSvg(money.category),
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    timestampToString(money.id),
                    fontSize: 10,
                    fontFamily: Fonts.regular,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
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
        ),
      ),
    );
  }
}
