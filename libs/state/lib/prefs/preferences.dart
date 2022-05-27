import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String keySelectedTheme = 'KEY_SELECTED_THEME';
  static const String keySelectedLanguage = 'KEY_SELECTED_LANGUAGE';
  static const String keyIsInOfflineMode = 'KEY_IS_OFFLINE_MODE';
  static SharedPreferences? preferences;

  static init() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveToPreferences(String key, value) async {
    switch (value.runtimeType) {
      case String:
        await preferences?.setString(key, value);
        break;
      case bool:
        await preferences?.setBool(key, value);
        break;
      case double:
        await preferences?.setDouble(key, value);
        break;
      case int:
        await preferences?.setInt(key, value);
        break;
    }
  }

  static Future<Object?> getFromPreference(String key) async {
    return preferences?.get(key);
  }
}
