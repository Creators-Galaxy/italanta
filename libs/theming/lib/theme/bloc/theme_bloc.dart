import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:theming/theming.dart';
import 'package:utils/utils.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: getAppThemeData[AppThemeType.light]!)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit(ThemeState(themeData: getAppThemeData[event.appThemeType]!));
      }
    });
  }
}
