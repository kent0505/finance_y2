part of 'money_bloc.dart';

@immutable
sealed class MoneyState {}

final class MoneyInitial extends MoneyState {}

final class MoneyLoadedState extends MoneyState {
  MoneyLoadedState({required this.money});

  final List<Money> money;
}
