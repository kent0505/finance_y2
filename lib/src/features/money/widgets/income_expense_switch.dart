import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_widget.dart';

class IncomeExpenseSwitch extends StatelessWidget {
  const IncomeExpenseSwitch({
    super.key,
    required this.income,
    required this.onPressed,
  });

  final bool income;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(65),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 7,
            right: income ? 170 : 10,
            child: Container(
              height: 52,
              width: 172,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(52),
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: CuperButton(
              onPressed: income
                  ? null
                  : () {
                      onPressed(true);
                    },
              minSize: 66,
              child: SizedBox(
                width: 160,
                child: Center(
                  child: TextWidget(
                    'Income',
                    fontSize: 22,
                    fontFamily: Fonts.bold,
                    color: income ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: CuperButton(
              onPressed: income
                  ? () {
                      onPressed(false);
                    }
                  : null,
              minSize: 66,
              child: SizedBox(
                width: 160,
                child: Center(
                  child: TextWidget(
                    'Expense',
                    fontSize: 22,
                    fontFamily: Fonts.bold,
                    color: income ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
