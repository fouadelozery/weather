import 'package:dio/dio.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weather_state.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:flutter_application_4/services/weather_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weathercubit extends Cubit<WeatherState> {
  Weathercubit() : super(Noweatherstate());
  getweather({required String cityname}) async {
    try {
      WeatherModel weatherModel =
          await WeatherServices(Dio()).getcurrentweather(city: cityname);
      emit(Weatherloadded());
    } on Exception catch (e) {
      emit(Weatherfailurestate());
    }
  }
}
