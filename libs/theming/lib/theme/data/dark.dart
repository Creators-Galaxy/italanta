part of theme;

ThemeData _darkTheme = _darkThemeReference.copyWith(
// Define the default brightness and colors.
    brightness: Brightness.dark,
    backgroundColor: CityScapeColors.complementaryColor3,
    primaryColor: Colors.black,
    dividerColor: CityScapeColors.dimGrey,

    switchTheme:  SwitchThemeData(
      thumbColor: MaterialStateProperty.all(CityScapeColors.complementaryColor4),
      trackColor: MaterialStateProperty.all(CityScapeColors.complementaryColor4.withOpacity(.5)),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(CityScapeColors.complementaryColor4),
    ),
    iconTheme:
    IconThemeData(size: 28.0, color: CityScapeColors.complementaryColor4),
    appBarTheme: AppBarTheme(
      iconTheme:
      IconThemeData(size: 28.0, color: CityScapeColors.complementaryColor4),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: CityScapeColors.black.withOpacity(.9),
            onSurface: Colors.white,
            side: BorderSide(
                width: 3.0, color: CityScapeColors.black.withOpacity(.6)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle:  GoogleFonts.emilysCandy(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
                color: CityScapeColors.black.withOpacity(.7)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: CityScapeColors.complementaryColor4,
            onPrimary: CityScapeColors.black.withOpacity(.9),
            onSurface: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.emilysCandy(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ))),
    textTheme:
    GoogleFonts.emilysCandyTextTheme(_darkThemeReference.textTheme).copyWith(
      headline1: GoogleFonts.emilysCandy(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          color: CityScapeColors.black),
      headline2: GoogleFonts.emilysCandy(
          fontSize: 27,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.black.withOpacity(.8)),
      headline3: GoogleFonts.emilysCandy(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          color: CityScapeColors.headLineBlack),
      headline4: GoogleFonts.emilysCandy(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.black.withOpacity(.6)),
      headline5: GoogleFonts.emilysCandy(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: CityScapeColors.complementaryColor4),
      headline6: GoogleFonts.emilysCandy(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: CityScapeColors.black.withOpacity(.8)),
      subtitle1: GoogleFonts.emilysCandy(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.complementaryColor4.withOpacity(.8)),
      subtitle2: GoogleFonts.emilysCandy(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: CityScapeColors.headLineBlack),
      bodyText1: GoogleFonts.emilysCandy(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.headLineBlack),
      caption: GoogleFonts.emilysCandy(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: CityScapeColors.dimGrey),
      overline: GoogleFonts.emilysCandy(
          color: CityScapeColors.black.withOpacity(.7),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0),
      bodyText2: GoogleFonts.emilysCandy(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.emilysCandy(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    ));
