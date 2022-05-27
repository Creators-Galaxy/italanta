import 'package:bloc/bloc.dart';
import 'package:model/model.dart';
import 'package:state/state.dart';

import 'city_repository_impl.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityRepository _cityRepository;

  CityCubit(this._cityRepository) : super(CityStateInitial());
  bool _isOfflineMode=false;
  Future<void> getData() async {

    Object? offlineMode=await Preferences.getFromPreference(Preferences.keyIsInOfflineMode);
    if(offlineMode!=null){
      _isOfflineMode=offlineMode.toString().toLowerCase()=='true';
    }
    try {
      List<City> cities=await _cityRepository.fetchCities(_isOfflineMode);
      emit(CityStateLoaded(cities: cities));
    }
    on Exception {
      emit(CityStateError(
          message: "Could not fetch the list, please try again later!"));
    }
  }
}
