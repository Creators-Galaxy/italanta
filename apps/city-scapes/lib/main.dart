import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state/state.dart';
import 'package:theming/theming.dart';
import 'package:utils/misc/navigate.dart';
import 'package:utils/utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  // Prevent google font library from making any http requests for fonts
  GoogleFonts.config.allowRuntimeFetching = false;
  await Preferences.init();

  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => LocalesBloc()),
        //BlocProvider(create: (context) => CityCubit(CityRepositoryImpl())),
      ],
      child: EasyLocalization(
          supportedLocales: Translations.all,
          path: 'assets/translations',
          fallbackLocale: Translations.all[0],
          child: const CityScapes()),
    )),
    blocObserver: CityScapeBlocObserver(),
  );
}

class CityScapes extends StatelessWidget {
  const CityScapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData? themeData;
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      themeData = state.themeData;
      return BlocBuilder<LocalesBloc, LocalesState>(
          builder: (context, state) {
        context.setLocale(state.localeData);
        return MaterialApp(
          title: 'City Scapes',
          theme: themeData,
          debugShowCheckedModeBanner: false,
          routes: Navigate.routes,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      });
    });
  }
}
