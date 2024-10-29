import 'package:dio/dio.dart';
import 'package:flutter_application_4/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  WeatherServices(this.dio);
  Future<WeatherModel> getcurrentweather({required String city}) async {
    try {
      Response response = await dio.get(
          '$baseurl/forecast.json?key=9677a914f69448c6bd0171243242510&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ?? 'opps error';

      throw Exception(errormessage);
    } catch (e) {
      throw Exception('error');
    }
  }
}
