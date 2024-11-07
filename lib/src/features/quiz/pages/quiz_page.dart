import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12 + getStatusBar(context)),
        Center(
          child: TextWidget(
            'Question ${index + 1}',
            fontSize: 22,
            fontFamily: Fonts.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
