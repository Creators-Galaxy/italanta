import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:utils/utils.dart';

class CityService {
  Future<List<City>> fetchCitiesOnline() async {
    http.Response response =
        await http.get(Uri.parse(CityScapesUrls.kenyaCities));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => City.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<List<City>> fetchCitiesOffline() async {
    final String response =
        await rootBundle.loadString('assets/json/kenya_counties.json');
    return (jsonDecode(response) as List<dynamic>)
        .map((e) => City.fromJson(e))
        .toList();
  }
}
