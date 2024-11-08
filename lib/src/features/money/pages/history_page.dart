import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/money/money_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../home/widgets/money_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('History'),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  if (state is MoneyLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 44,
                      ),
                      itemCount: state.money.length,
                      itemBuilder: (context, index) {
                        return MoneyCard(money: state.money[index]);
                      },
                    );
                  }

                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
