part of 'locales_bloc.dart';

 class LocalesState extends Equatable {
  final Locale localeData;

  const LocalesState(this.localeData);

  @override
  List<Object> get props => [localeData];
}

class LocalesInitial extends LocalesState {
  const LocalesInitial(Locale localeData) : super(localeData);
}
