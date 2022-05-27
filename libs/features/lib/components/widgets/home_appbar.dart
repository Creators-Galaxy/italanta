part of components;

class HomeAppbar {
  AppBar appBar(BuildContext context, VoidCallback callback) {
    initialiseConfigPrefData();
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(LocaleKeys.homeScreenTitle.tr().camelCase(),
          style: Theme.of(context).textTheme.headline1),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 24,
          ),
          onPressed: () {
            //
            callback();
          },
        ),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.gear,
            size: 24,
          ),
          onPressed: () {
            _showBottomSheet(context);
          },
        )
      ],
    );
  }

  bool _isDarkThemeSelected = false;
  bool _isOfflineMode = false;
  String _languageInUse = LanguageType.english.name;

  initialiseConfigPrefData() async {
    Object? offlineMode =
        await Preferences.getFromPreference(Preferences.keyIsInOfflineMode);
    if (offlineMode != null) {
      _isOfflineMode = offlineMode.toString().toLowerCase() == 'true';
    }
    Object? appThemeTypeFromPreference =
        await Preferences.getFromPreference(Preferences.keySelectedTheme);
    AppThemeType appThemeType = appThemeTypeFromPreference == null
        ? AppThemeType.light
        : AppThemeType.values.byName(appThemeTypeFromPreference.toString());
    _isDarkThemeSelected = appThemeType == AppThemeType.dark;

    Object? appLanguageTypeFromPreference =
        await Preferences.getFromPreference(Preferences.keySelectedLanguage);
    _languageInUse = appLanguageTypeFromPreference == null
        ? LanguageType.english.name
        : appLanguageTypeFromPreference.toString();
  }

  void _showBottomSheet(context) async {
    initialiseConfigPrefData();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return AppBottomSheet(
          isDarkThemeSelected: _isDarkThemeSelected,
          languageInUse: _languageInUse,
          toggleOfflineStatus: _isOfflineMode,
        );
      },
    );
  }
}
