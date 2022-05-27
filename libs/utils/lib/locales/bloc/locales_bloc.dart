import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:utils/enums/enums.dart';
import 'package:utils/locales/locales.dart';

part 'locales_event.dart';

part 'locales_state.dart';

class LocalesBloc extends Bloc<LocalesEvent, LocalesState> {
  LocalesBloc()
      : super(LocalesInitial(getAppTranslationData[LanguageType.english]!)) {
    on<LocalesChanged>((event, emit) {
      emit(LocalesState(getAppTranslationData[event.languageType]!));
    });
  }
}
