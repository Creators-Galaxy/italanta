library locales;

import 'dart:ui';

import 'package:utils/enums/enums.dart';

export 'bloc/locales_bloc.dart';

part 'data/locale_keys.g.dart';

part 'data/translations.dart';

Map<LanguageType, Locale> get getAppTranslationData {
  return {
    LanguageType.english: Translations.all[0],
    LanguageType.swahili: Translations.all[1],
  };
}
