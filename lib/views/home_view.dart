import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weather_state.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weathercubit.dart';
import 'package:flutter_application_4/views/search_view.dart';
import 'package:flutter_application_4/widgets/no_weather_body.dart';
import 'package:flutter_application_4/widgets/weather_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Weathercubit(),
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<Weathercubit, WeatherState>(
          builder: (context, state) {
            if (state is Noweatherstate) {
              return const NoWeatherBody();
            } else if (state is Weatherloadded) {
              return const WeatherInfoBody();
            } else {
              return const Text('there was error');
            }
          },
        ),
      )),
    );
  }
}
