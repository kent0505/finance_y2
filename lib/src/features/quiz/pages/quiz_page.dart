import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../widgets/answer_card.dart';
import '../widgets/correct_count_dialog.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correctAnswers = 0;
  bool buttonActive = true;
  Answer selectedAnswer = Answer(
    title: '',
    isCorrect: false,
  );

  void resetQuiz() {
    index = 0;
    correctAnswers = 0;
    quizesList.shuffle();
    context.read<ButtonBloc>().add(CheckButtonActive(controllers: const ['']));
    for (Quiz quiz in quizesList) {
      quiz.answers.shuffle();
    }
  }

  void onAnswerCard(Answer answer) {
    if (!buttonActive) return;
    selectedAnswer = answer;
    answer.color = Colors.black;
    context.read<ButtonBloc>().add(CheckButtonActive(controllers: const [' ']));
  }

  void onAnswerButton() async {
    buttonActive = false;
    if (selectedAnswer.isCorrect) {
      selectedAnswer.color = const Color(0xff00FF88);
      correctAnswers++;
    } else {
      selectedAnswer.color = const Color(0xffFF0000);
    }
    context.read<ButtonBloc>().add(CheckButtonActive(controllers: const ['']));
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        buttonActive = true;
        selectedAnswer.color = Colors.white;
        if (index == 19) {
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return CorrectCountDialog(
                  correctAnswers: correctAnswers,
                  onPressed: () {
                    context.pop();
                    resetQuiz();
                    setState(() {});
                  },
                );
              },
            );
          }
        } else {
          setState(() {
            index++;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    resetQuiz();
  }

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
        const Spacer(),
        SizedBox(
          height: 200,
          width: 300,
          child: TextWidget(
            quizesList[index].question,
            fontSize: 32,
            fontFamily: Fonts.medium,
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerCard(
                  id: 'A',
                  answer: quizesList[index].answers[0],
                  selected: selectedAnswer,
                  onPressed: onAnswerCard,
                ),
                const SizedBox(width: 6),
                AnswerCard(
                  id: 'B',
                  answer: quizesList[index].answers[1],
                  selected: selectedAnswer,
                  onPressed: onAnswerCard,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerCard(
                  id: 'C',
                  answer: quizesList[index].answers[2],
                  selected: selectedAnswer,
                  onPressed: onAnswerCard,
                ),
                const SizedBox(width: 6),
                AnswerCard(
                  id: 'D',
                  answer: quizesList[index].answers[3],
                  selected: selectedAnswer,
                  onPressed: onAnswerCard,
                ),
              ],
            );
          },
        ),
        const Spacer(),
        PrimaryButton(
          title: 'Answer',
          onPressed: onAnswerButton,
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}
