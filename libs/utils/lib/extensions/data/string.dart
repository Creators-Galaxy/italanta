part of extension;

extension StringCasingExtension on String {
  String capitalize() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String camelCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.capitalize())
        .join(' ');
  }

  String shortenString(int maxLength) {
    if (maxLength < 1 || maxLength >= 10) {
      return this;
    }
    String _stringDots = "";
    if (length > maxLength) {
      _stringDots = "..";
    }
    return substring(0, maxLength) + _stringDots;
  }
}
