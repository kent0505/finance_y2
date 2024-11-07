import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/money/money_bloc.dart';
import '../../../core/models/extra_model.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';

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

  // void checkActive() {
  //   setState(() {
  //     active = getButtonActive([
  //       controller1,
  //       controller2,
  //       controller3,
  //     ]);
  //   });
  // }

  void onAmount(bool increment) {
    int amount = int.tryParse(controller2.text) ?? 0;
    setState(() {
      if (increment) {
        amount += 100;
      } else {
        amount -= 100;
      }
      controller2.text = amount.toString();
    });
  }

  void onCategory(String category) {
    controller3.text = category;
    // checkActive();
  }

  void onSave() {
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
      // active = true;
      controller1.text = widget.extra.money.title;
      controller2.text = widget.extra.money.amount.toString();
      controller3.text = widget.extra.money.category;
    }
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
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(),
        ],
      ),
    );
  }
}
