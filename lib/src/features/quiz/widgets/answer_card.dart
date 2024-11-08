import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_widget.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.id,
    required this.answer,
    required this.selected,
    required this.onPressed,
  });

  final String id;
  final Answer answer;
  final Answer selected;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 106,
      width: 162,
      decoration: BoxDecoration(
        color: identical(answer, selected) ? answer.color : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: CuperButton(
        onPressed: () {
          onPressed(answer);
        },
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Center(
                child: TextWidget(
                  '$id.',
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                  color:
                      identical(answer, selected) ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: TextWidget(
                answer.title,
                fontSize: 12,
                fontFamily: Fonts.medium,
                maxLines: 5,
                color:
                    identical(answer, selected) ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
