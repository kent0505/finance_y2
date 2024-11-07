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
    await getMoney();
    emit(MoneyLoadedState(money: modelsList));
  }

  void _addMoney(
    AddMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    modelsList.insert(0, event.money);
    // modelsList.add(event.money);
    await updateMoney();
    emit(MoneyLoadedState(money: modelsList));
  }

  void _editMoney(
    EditMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    for (Money model in modelsList) {
      if (identical(model, event.money)) {
        model.title = event.money.title;
      }
    }
    await updateMoney();
    emit(MoneyLoadedState(money: modelsList));
  }

  void _deleteMoney(
    DeleteMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    modelsList.removeWhere((money) => identical(money, event.money));
    await updateMoney();
    emit(MoneyLoadedState(money: modelsList));
  }
}
