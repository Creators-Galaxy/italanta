import 'package:equatable/equatable.dart';
import 'package:model/data/city.dart';

abstract class CityState extends Equatable {
  @override
  List<Object> get props => [];
}

class CityStateInitial extends CityState {}

class CityStateLoaded extends CityState {
  final List<City> cities;

  CityStateLoaded({required this.cities});
}

class CityStateError extends CityState{
  final String message;

  CityStateError({required this.message});
}
