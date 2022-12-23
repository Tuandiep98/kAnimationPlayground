part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  final ThemeData themeData;

  const SettingState({
    required this.themeData,
  });

  @override
  List<Object> get props => [themeData];
}

class ThemeLoaded extends SettingState {
  const ThemeLoaded({
    required themeData,
  }) : super(themeData: themeData);

  @override
  List<Object> get props => [themeData];
}

class ThemeLoadedWithAccount extends SettingState {
  final AccountModel currentUser;

  const ThemeLoadedWithAccount(
    this.currentUser, {
    required themeData,
  }) : super(themeData: themeData);

  @override
  List<Object> get props => [themeData, currentUser];
}
