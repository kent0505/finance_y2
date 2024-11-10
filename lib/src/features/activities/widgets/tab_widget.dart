import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_widget.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.tabIndex,
    required this.onPressed,
  });

  final int tabIndex;
  final void Function(int) onPressed;

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
            right: tabIndex == 0
                ? 232
                : tabIndex == 1
                    ? 120
                    : 7,
            child: Container(
              height: 52,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(52),
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: CuperButton(
              onPressed: tabIndex == 0
                  ? null
                  : () {
                      onPressed(0);
                    },
              minSize: 66,
              child: SizedBox(
                width: 110,
                child: Center(
                  child: TextWidget(
                    'Day',
                    fontSize: 22,
                    fontFamily: Fonts.bold,
                    color: tabIndex == 0 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 120,
            child: CuperButton(
              onPressed: tabIndex == 1
                  ? null
                  : () {
                      onPressed(1);
                    },
              minSize: 66,
              child: SizedBox(
                width: 110,
                child: Center(
                  child: TextWidget(
                    'Week',
                    fontSize: 22,
                    fontFamily: Fonts.bold,
                    color: tabIndex == 1 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: CuperButton(
              onPressed: tabIndex == 2
                  ? null
                  : () {
                      onPressed(2);
                    },
              minSize: 66,
              child: SizedBox(
                width: 110,
                child: Center(
                  child: TextWidget(
                    'Month',
                    fontSize: 22,
                    fontFamily: Fonts.bold,
                    color: tabIndex == 2 ? Colors.black : Colors.white,
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
