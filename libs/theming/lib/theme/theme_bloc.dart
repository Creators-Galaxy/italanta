library theme;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/utils.dart';

export 'bloc/theme_bloc.dart';

part 'data/dark.dart';

part 'data/light.dart';

final ThemeData _lightThemeReference = ThemeData.light();
final ThemeData _darkThemeReference = ThemeData.dark();

Map<AppThemeType, ThemeData> get getAppThemeData {
  return {AppThemeType.light: _lightTheme, AppThemeType.dark: _darkTheme};
}
