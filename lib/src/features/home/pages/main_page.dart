import 'package:finance_y2/src/core/utils.dart';
import 'package:finance_y2/src/core/widgets/buttons/cuper_button.dart';
import 'package:finance_y2/src/core/widgets/others/svg_widget.dart';
import 'package:finance_y2/src/core/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/money/money_bloc.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/others/loading_widget.dart';
import '../widgets/money_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          width: 300,
          child: Column(
            children: [
              SizedBox(height: 20 + getStatusBar(context)),
              Row(
                children: [
                  const TextWidget(
                    'Total Balance',
                    fontSize: 16,
                    fontFamily: Fonts.bold,
                  ),
                  const Spacer(),
                  CuperButton(
                    onPressed: () {
                      context.push('/history');
                    },
                    minSize: 20,
                    child: const Text(
                      'History',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: Fonts.regular,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      TextWidget(
                        '\$${formatNumber(totalIncomes - totalExpenses)}',
                        fontSize: 40,
                        fontFamily: Fonts.unb900,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 4),
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      const SvgWidget('assets/grow.svg'),
                      const SizedBox(width: 6),
                      TextWidget(
                        comparePreviousMonthIncomes(),
                        fontSize: 14,
                        fontFamily: Fonts.medium,
                      ),
                      const SizedBox(width: 4),
                      TextWidget(
                        'than in ${getPreviousMonthName()}.',
                        fontSize: 14,
                        fontFamily: Fonts.regular,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: BlocBuilder<MoneyBloc, MoneyState>(
              builder: (context, state) {
                if (state is MoneyLoading) {
                  return const LoadingWidget();
                }

                if (state is MoneyLoaded) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 14),
                      const Center(
                        child: SizedBox(
                          width: 300,
                          child: TextWidget(
                            'Activities',
                            fontSize: 16,
                            fontFamily: Fonts.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...List.generate(
                        state.money.length,
                        (index) {
                          return MoneyCard(money: state.money[index]);
                        },
                      ),
                      const SizedBox(height: 100),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ],
    );
  }
}
