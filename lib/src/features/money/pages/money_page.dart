import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/money/money_bloc.dart';
import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/models/extra_model.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../widgets/category_card.dart';
import '../widgets/income_expense_switch.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({
    super.key,
    required this.extra,
  });

  final ExtraModel extra;

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool income = false;

  void onIncome(bool value) {
    if (value == income) return;
    income = value;
    controller3.clear();
    checkButtonActive();
  }

  void checkButtonActive() {
    context.read<ButtonBloc>().add(
          CheckButtonActive(
            controllers: [
              controller1.text,
              controller2.text,
              controller3.text,
            ],
          ),
        );
  }

  void onCategory(String category) {
    controller3.text = category;
    checkButtonActive();
  }

  void onNext() {
    context.read<MoneyBloc>().add(
          widget.extra.add
              ? AddMoneyEvent(
                  money: Money(
                    id: getCurrentTimestamp(),
                    title: controller1.text,
                    amount: int.tryParse(controller2.text) ?? 0,
                    category: controller3.text,
                    income: income,
                  ),
                )
              : EditMoneyEvent(
                  money: Money(
                    id: widget.extra.money.id,
                    title: controller1.text,
                    amount: int.tryParse(controller2.text) ?? 0,
                    category: controller3.text,
                    income: income,
                  ),
                ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: income ? 'Delete Income?' : 'Delete Expense?',
          onYes: () {
            context
                .read<MoneyBloc>()
                .add(DeleteMoneyEvent(money: widget.extra.money));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (!widget.extra.add) {
      income = widget.extra.money.income;
      controller1.text = widget.extra.money.title;
      controller2.text = widget.extra.money.amount.toString();
      controller3.text = widget.extra.money.category;
    }
    checkButtonActive();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            widget.extra.add ? 'New' : 'Edit',
            onDelete: widget.extra.add ? null : onDelete,
          ),
          const SizedBox(height: 12),
          BlocBuilder<ButtonBloc, ButtonState>(
            builder: (context, state) {
              return IncomeExpenseSwitch(
                income: income,
                onPressed: onIncome,
              );
            },
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 30),
                children: [
                  const _Title('Category'),
                  const SizedBox(height: 30),
                  BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      return Center(
                        child: SizedBox(
                          width: 340,
                          child: Wrap(
                            runSpacing: 16,
                            spacing: 20,
                            children: [
                              if (income) ...[
                                CategoryCard(
                                  title: 'Passive',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Salary',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Rent',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Business',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Freelance',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Investment ',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Dividends',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Royalty',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                              ] else ...[
                                CategoryCard(
                                  title: 'Investment',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Food',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Transport',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Procurement',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                                CategoryCard(
                                  title: 'Rest',
                                  current: controller3.text,
                                  onPressed: onCategory,
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const _Title('Title'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller1,
                    hintText: 'Name title',
                    onChanged: checkButtonActive,
                  ),
                  const SizedBox(height: 20),
                  const _Title('Amounts (\$)'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller2,
                    hintText: 'Amount Income',
                    number: true,
                    length: 6,
                    onChanged: checkButtonActive,
                  ),
                  const SizedBox(height: 60),
                  PrimaryButton(
                    title: 'Next',
                    onPressed: onNext,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget(
        title,
        fontSize: 16,
        fontFamily: Fonts.medium,
      ),
    );
  }
}
