import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/money/money_bloc.dart';
import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/others/bar_chart.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../widgets/tab_widget.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int tabIndex = 0;

  void onTab(int value) {
    setState(() {
      tabIndex = value;
    });
  }

  int getTotal(bool isIncome) {
    if (tabIndex == 0) {
      return getTotalDayIncomeExpense(isIncome);
    } else if (tabIndex == 2) {
      return getTotalMonthIncomeExpense(isIncome);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12 + getStatusBar(context)),
        const Center(
          child: TextWidget(
            'Activities',
            fontSize: 22,
            fontFamily: Fonts.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        TabWidget(
          tabIndex: tabIndex,
          onPressed: onTab,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      const TextWidget(
                        'Income',
                        fontSize: 16,
                        fontFamily: Fonts.bold,
                      ),
                      const Spacer(),
                      TextWidget(
                        '\$${formatNumber(getTotal(true))}',
                        fontSize: 18,
                        fontFamily: Fonts.unb900,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                BlocBuilder<MoneyBloc, MoneyState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tabIndex == 0) ...[
                          BarChart(
                            title: getDayNumber(4).day.toString(),
                            height: normalizeDay(true)[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(3).day.toString(),
                            height: normalizeDay(true)[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(2).day.toString(),
                            height: normalizeDay(true)[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(1).day.toString(),
                            height: normalizeDay(true)[1],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(0).day.toString(),
                            height: normalizeDay(true)[0],
                          ),
                        ] else if (tabIndex == 1) ...[
                          BarChart(
                            title: 'Week 1',
                            height: normalizeToMax70()[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 2',
                            height: normalizeToMax70()[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 3',
                            height: normalizeToMax70()[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 4',
                            height: normalizeToMax70()[1],
                          ),
                        ] else ...[
                          BarChart(
                            title: getMonthName(5),
                            height: normalizeMonth(true)[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(4),
                            height: normalizeMonth(true)[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(3),
                            height: normalizeMonth(true)[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(2),
                            height: normalizeMonth(true)[1],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(1),
                            height: normalizeMonth(true)[0],
                          ),
                        ],
                      ],
                    );
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      const TextWidget(
                        'Expense',
                        fontSize: 16,
                        fontFamily: Fonts.bold,
                      ),
                      const Spacer(),
                      TextWidget(
                        '\$${formatNumber(getTotal(false))}',
                        fontSize: 18,
                        fontFamily: Fonts.unb900,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                BlocBuilder<MoneyBloc, MoneyState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tabIndex == 0) ...[
                          BarChart(
                            title: getDayNumber(4).day.toString(),
                            height: normalizeDay(false)[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(3).day.toString(),
                            height: normalizeDay(false)[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(2).day.toString(),
                            height: normalizeDay(false)[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(1).day.toString(),
                            height: normalizeDay(false)[1],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getDayNumber(0).day.toString(),
                            height: normalizeDay(false)[0],
                          ),
                        ] else if (tabIndex == 1) ...[
                          BarChart(
                            title: 'Week 1',
                            height: normalizeToMax70()[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 2',
                            height: normalizeToMax70()[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 3',
                            height: normalizeToMax70()[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: 'Week 4',
                            height: normalizeToMax70()[1],
                          ),
                        ] else ...[
                          BarChart(
                            title: getMonthName(5),
                            height: normalizeMonth(false)[4],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(4),
                            height: normalizeMonth(false)[3],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(3),
                            height: normalizeMonth(false)[2],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(2),
                            height: normalizeMonth(false)[1],
                          ),
                          const SizedBox(width: 33),
                          BarChart(
                            title: getMonthName(1),
                            height: normalizeMonth(false)[0],
                          ),
                        ],
                      ],
                    );
                  },
                ),
                const Spacer(),
                Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 44),
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 38),
                      const TextWidget(
                        'Total:',
                        fontSize: 16,
                        fontFamily: Fonts.medium,
                      ),
                      BlocBuilder<MoneyBloc, MoneyState>(
                        builder: (context, state) {
                          return Expanded(
                            child: TextWidget(
                              '\$${formatNumber(getTotal(true) - getTotal(false))}',
                              fontSize: 24,
                              fontFamily: Fonts.unb900,
                              textAlign: TextAlign.end,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
