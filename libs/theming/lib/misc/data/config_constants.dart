part of misc;

abstract class ConfigConstants {
  static statusBarColor({Brightness brightness = Brightness.dark}) =>
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness);
}
