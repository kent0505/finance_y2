import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/db/prefs.dart';
import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_widget.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int index = 1;

  String getTitle() {
    return index == 1
        ? 'Keep track of your All financial tools in one app'
        : 'View graphs to track financial expenses and income';
  }

  String getDescription() {
    return index == 1
        ? 'Make your budget, keep track of your income and\nexpenses, monitor currency and cryptocurrency\nexchange rates, and receive notifications about rates\nand their changes.'
        : 'This mobile app will help you manage your economy\neasily, profitably and economically';
  }

  void onContinue() async {
    if (index == 2) {
      await saveOnboard().then((value) {
        if (mounted) {
          context.go('/home');
        }
      });
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: getStatusBar(context)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: TextWidget(
              getTitle(),
              fontSize: 32,
              fontFamily: Fonts.unb700,
              color: Colors.black,
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              AppColors.main,
              BlendMode.color,
            ),
            child: Image.asset(
              'assets/images/onboard$index.png',
              width: 550,
              height: 370,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              title: 'CONTINUE',
              onPressed: onContinue,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 164,
            child: Center(
              child: TextWidget(
                getDescription(),
                fontSize: 14,
                fontFamily: Fonts.light,
                color: Colors.black,
                maxLines: 10,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
