part of screens;

class PageBuilder extends StatefulWidget {
  const PageBuilder({Key? key}) : super(key: key);

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  void initState() {
    super.initState();
    _loadLocaleFromPreference();
    _loadThemeFromPreference();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }

  _loadThemeFromPreference() async {
    Object? appThemeTypeFromPreference =
        await Preferences.getFromPreference(Preferences.keySelectedTheme);
    // If theme not found in preference
    if (appThemeTypeFromPreference == null) return;
    AppThemeType appThemeType =
        AppThemeType.values.byName(appThemeTypeFromPreference.toString());

    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeChanged(appThemeType: appThemeType));
  }

  _loadLocaleFromPreference() async {
    Object? appLanguageTypeFromPreference =
        await Preferences.getFromPreference(Preferences.keySelectedLanguage);
    if (appLanguageTypeFromPreference == null) return;

    BlocProvider.of<LocalesBloc>(context).add(LocalesChanged(
        LanguageType.values.byName(appLanguageTypeFromPreference.toString())));
  }
}
