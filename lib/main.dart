import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weather_state.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weathercubit.dart';
import 'package:flutter_application_4/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Weathercubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<Weathercubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<Weathercubit>(context)
                          .weatherModel
                          ?.weathercondition),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        }));
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
