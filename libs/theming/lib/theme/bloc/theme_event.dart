part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  // Passing class fields in a list to the Equatable super class
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppThemeType appThemeType;

  const ThemeChanged({required this.appThemeType});

  @override
  List<Object> get props => [appThemeType];
}
