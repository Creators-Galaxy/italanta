class City {
  final String name;
  final String code;
  final String areaSqKm;
  final List<dynamic> capital;

  City(
      {required this.name,
      required this.code,
      required this.areaSqKm,
      required this.capital});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'areaSqKm': areaSqKm,
      'capital': capital,
    };
  }

  City.fromJson(Map<String, Object?> json)
      : this(
            name: json['name'] as String,
            code: json['code'] as String,
            areaSqKm: json['areaSqKm'] as String,
            capital: json['capital'] as List<dynamic>);
}
