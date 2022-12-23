part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ThemeStarted extends SettingEvent {}

class ThemeChanged extends SettingEvent {
  const ThemeChanged();

  @override
  List<Object> get props => [];
}

class GoogleSigninClicked extends SettingEvent {
  const GoogleSigninClicked();
  @override
  List<Object> get props => [];
}

class SignoutClicked extends SettingEvent {}
