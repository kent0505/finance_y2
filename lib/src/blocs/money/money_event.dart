part of 'money_bloc.dart';

@immutable
sealed class MoneyEvent {}

class GetMoneyEvent extends MoneyEvent {}

class AddMoneyEvent extends MoneyEvent {
  AddMoneyEvent({required this.money});

  final Money money;
}

class EditMoneyEvent extends MoneyEvent {
  EditMoneyEvent({required this.money});

  final Money money;
}

class DeleteMoneyEvent extends MoneyEvent {
  DeleteMoneyEvent({required this.money});

  final Money money;
}
