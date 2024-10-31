class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String weathercondition;
  WeatherModel(
      {required this.city,
      required this.date,
      this.image,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.weathercondition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        city: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weathercondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
