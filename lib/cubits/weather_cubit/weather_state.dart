import 'package:flutter_application_4/models/weather_model.dart';

class WeatherState {}

class Noweatherstate extends WeatherState {}

class Weatherloadded extends WeatherState {
  final WeatherModel weatherModel;

  Weatherloadded(this.weatherModel);
}

class Weatherfailurestate extends WeatherState {
  final String errormessage;

  Weatherfailurestate(this.errormessage);
}

class weatherloadingstate extends WeatherState {}
