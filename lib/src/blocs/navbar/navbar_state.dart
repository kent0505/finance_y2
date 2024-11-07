part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

final class NavbarActivities extends NavbarState {}

final class NavbarQuiz extends NavbarState {}

final class NavbarSettings extends NavbarState {}
