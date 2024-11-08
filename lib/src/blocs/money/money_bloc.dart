import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/models/money.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<MoneyEvent>(
      (event, emit) => switch (event) {
        GetMoneyEvent() => _getMoney(event, emit),
        AddMoneyEvent() => _addMoney(event, emit),
        EditMoneyEvent() => _editMoney(event, emit),
        DeleteMoneyEvent() => _deleteMoney(event, emit),
      },
    );
  }

  void _getMoney(
    GetMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    emit(MoneyLoading());
    await getMoney();
    emit(MoneyLoaded(money: moneyList));
  }

  void _addMoney(
    AddMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    moneyList.insert(0, event.money);
    // moneyList.add(event.money);
    await updateMoney();
    emit(MoneyLoaded(money: moneyList));
  }

  void _editMoney(
    EditMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    for (Money money in moneyList) {
      if (identical(money.id, event.money.id)) {
        money.title = event.money.title;
        money.amount = event.money.amount;
        money.category = event.money.category;
        money.income = event.money.income;
      }
    }
    await updateMoney();
    emit(MoneyLoaded(money: moneyList));
  }

  void _deleteMoney(
    DeleteMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    moneyList.removeWhere((money) => identical(money.id, event.money.id));
    await updateMoney();
    emit(MoneyLoaded(money: moneyList));
  }
}
