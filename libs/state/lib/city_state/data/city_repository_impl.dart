import 'package:model/model.dart';
import 'package:state/state.dart';

import 'city_service.dart';

class CityRepositoryImpl implements CityRepository {
  CityService service = CityService();

  @override
  Future<List<City>> fetchCities(bool offlineMode) {
    return offlineMode
        ? service.fetchCitiesOffline()
        : service.fetchCitiesOnline();
  }
}

abstract class CityRepository {
  Future<List<City>> fetchCities(bool offlineMode);
}
