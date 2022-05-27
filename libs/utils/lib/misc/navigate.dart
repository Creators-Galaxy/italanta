import 'package:features/features.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutePaths.pageBuilder: (context) => const PageBuilder(),
    RoutePaths.splash: (context) => const Splash(),
    RoutePaths.home: (context) => const Home(),
  };
}
