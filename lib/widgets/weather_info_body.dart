import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weathercubit.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weather.weathercondition),
              getThemeColor(weather.weathercondition)[200]!,
              getThemeColor(weather.weathercondition)[300]!,
              getThemeColor(weather.weathercondition)[500]!,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.city,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${(weather.date.hour)}:${(weather.date.minute)}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                ),
                Text(
                  weather.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      weather.maxtemp.round().toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      weather.mintemp.round().toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weather.weathercondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber; // Sunny conditions

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey; // Cloudy conditions

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blue; // Foggy conditions

    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
      return Colors.lightBlue; // Rainy conditions

    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.grey; // Snowy conditions

    case 'thundery outbreaks possible':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
      return Colors.deepPurple; // Thunderstorm conditions

    case 'blizzard':
    case 'blowing snow':
      return Colors.blueGrey; // Severe snow conditions

    default:
      return Colors.blue; // Default for unknown conditions
  }
}
