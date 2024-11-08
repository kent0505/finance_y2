import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        onPressed(title);
      },
      child: SizedBox(
        height: 70,
        width: 100,
        child: Column(
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color:
                    identical(title, current) ? AppColors.main : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: SvgWidget(getCatSvg(title)),
              ),
            ),
            const SizedBox(height: 7),
            TextWidget(
              title,
              fontSize: 12,
              fontFamily: Fonts.regular,
            ),
          ],
        ),
      ),
    );
  }
}
