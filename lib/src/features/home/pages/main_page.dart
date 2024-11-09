import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/money/money_bloc.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/bar_chart.dart';
import '../../../core/widgets/others/loading_widget.dart';
import '../../../core/widgets/others/no_data.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../widgets/money_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: Column(
            children: [
              SizedBox(height: 20 + getStatusBar(context)),
              Row(
                children: [
                  const SizedBox(width: 44),
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
                  const SizedBox(width: 44),
                ],
              ),
              const SizedBox(height: 17),
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      const SizedBox(width: 44),
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
                      const SizedBox(width: 44),
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
              const Spacer(),
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BarChart(
                        month: getMonthName(5),
                        height: normalizeToMax70()[4],
                      ),
                      const SizedBox(width: 33),
                      BarChart(
                        month: getMonthName(4),
                        height: normalizeToMax70()[3],
                      ),
                      const SizedBox(width: 33),
                      BarChart(
                        month: getMonthName(3),
                        height: normalizeToMax70()[2],
                      ),
                      const SizedBox(width: 33),
                      BarChart(
                        month: getMonthName(2),
                        height: normalizeToMax70()[1],
                      ),
                      const SizedBox(width: 33),
                      BarChart(
                        month: getMonthName(1),
                        height: normalizeToMax70()[0],
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: BlocBuilder<MoneyBloc, MoneyState>(
              builder: (context, state) {
                if (state is MoneyLoading) {
                  return const LoadingWidget();
                }

                if (state is MoneyLoaded) {
                  if (state.money.isEmpty) return const NoData();

                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    children: [
                      const SizedBox(height: 14),
                      const TextWidget(
                        'Activities',
                        fontSize: 16,
                        fontFamily: Fonts.bold,
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
