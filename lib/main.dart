import 'package:flutter/material.dart';
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
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ));
  }
}
