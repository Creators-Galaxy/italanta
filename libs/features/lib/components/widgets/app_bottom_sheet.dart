part of components;

class AppBottomSheet extends StatefulWidget {
  AppBottomSheet(
      {Key? key,
      required this.isDarkThemeSelected,
      required this.toggleOfflineStatus,
      required this.languageInUse})
      : super(key: key);

  bool isDarkThemeSelected;
  bool toggleOfflineStatus;
  String languageInUse;

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      height: mediaQueryData.size.height / 2.5,
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  LocaleKeys.pref.tr().camelCase(),
                  style: Theme.of(context).textTheme.headline1,
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.language.tr().capitalize(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Radio<LanguageType>(
                        value: LanguageType.swahili,
                        groupValue:
                            LanguageType.values.byName(widget.languageInUse),
                        onChanged: (LanguageType? value) {
                          _onChangeLanguage(value);
                        },
                      ),
                      Text(
                        "English",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Radio<LanguageType>(
                        value: LanguageType.english,
                        groupValue:
                            LanguageType.values.byName(widget.languageInUse),
                        onChanged: (LanguageType? value) {
                          _onChangeLanguage(value);
                        },
                      ),
                      Text(
                        "Swahili",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.offline.tr(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Switch(
                    onChanged: (value) {
                      _onToggleOfflineMode(value);
                    },
                    value: widget.toggleOfflineStatus,
                  )
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Icon(FontAwesomeIcons.skull, size: 16,color: CityScapeColors.spooky,),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        LocaleKeys.themeToggle.tr().camelCase(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Switch(
                    onChanged: (value) {
                      _onThemeToggle(value);
                    },
                    value: widget.isDarkThemeSelected,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeLanguage(LanguageType? value) {
    if (value != null) {
      widget.languageInUse = value.name;
      setState(() {
        BlocProvider.of<LocalesBloc>(context).add(
            LocalesChanged(LanguageType.values.byName(widget.languageInUse)));
        Preferences.saveToPreferences(
            Preferences.keySelectedLanguage, widget.languageInUse);
      });
    }
  }

  void _onToggleOfflineMode(bool value) {
    setState(() {
      widget.toggleOfflineStatus = value;
      Preferences.saveToPreferences(Preferences.keyIsInOfflineMode, value);
    });
  }

  void _onThemeToggle(bool value) {
    widget.isDarkThemeSelected = value;
    setState(() {
      AppThemeType themePicked =
          widget.isDarkThemeSelected ? AppThemeType.dark : AppThemeType.light;
      BlocProvider.of<ThemeBloc>(context)
          .add(ThemeChanged(appThemeType: themePicked));
      Preferences.saveToPreferences(
          Preferences.keySelectedTheme, themePicked.name);
    });
  }
}
