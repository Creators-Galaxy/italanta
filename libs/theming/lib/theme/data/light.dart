part of theme;

ThemeData _lightTheme = _lightThemeReference.copyWith(
// Define the default brightness and colors.
    brightness: Brightness.light,
    backgroundColor: CityScapeColors.complementaryColor1,
    primaryColor: Colors.black,
    dividerColor: CityScapeColors.dimGrey,

    switchTheme:  SwitchThemeData(
        thumbColor: MaterialStateProperty.all(CityScapeColors.complementaryColor2),
        trackColor: MaterialStateProperty.all(CityScapeColors.complementaryColor2.withOpacity(.5)),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(CityScapeColors.complementaryColor2),
    ),
    iconTheme:
    IconThemeData(size: 28.0, color: CityScapeColors.complementaryColor2),
    appBarTheme: AppBarTheme(
      iconTheme:
          IconThemeData(size: 28.0, color: CityScapeColors.complementaryColor2),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: CityScapeColors.white.withOpacity(.9),
            onSurface: Colors.white,
            side: BorderSide(
                width: 3.0, color: CityScapeColors.white.withOpacity(.6)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
                color: CityScapeColors.white.withOpacity(.7)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: CityScapeColors.complementaryColor2,
            onPrimary: CityScapeColors.white.withOpacity(.9),
            onSurface: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.openSans(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: CityScapeColors.white.withOpacity(.7),
            textStyle: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ))),
    textTheme:
        GoogleFonts.openSansTextTheme(_lightThemeReference.textTheme).copyWith(
      headline1: GoogleFonts.openSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          color: CityScapeColors.white),
      headline2: GoogleFonts.openSans(
          fontSize: 27,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.white.withOpacity(.8)),
      headline3: GoogleFonts.openSans(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          color: CityScapeColors.headLineBlack),
      headline4: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.white.withOpacity(.6)),
      headline5: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: CityScapeColors.complementaryColor2),
      headline6: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: CityScapeColors.white.withOpacity(.8)),
      subtitle1: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.complementaryColor2.withOpacity(.8)),
      subtitle2: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: CityScapeColors.headLineBlack),
      bodyText1: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.headLineBlack),
      caption: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.spooky.withOpacity(.6)),
      overline: GoogleFonts.openSans(
          color: CityScapeColors.dimGrey,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0),
      bodyText2: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    ));
