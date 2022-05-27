part of 'locales_bloc.dart';

abstract class LocalesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LocalesChanged extends LocalesEvent {
  final LanguageType languageType;

  LocalesChanged(this.languageType);

  @override
  List<Object> get props => [languageType];
}
