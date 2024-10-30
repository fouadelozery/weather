import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/weather_cubit/weathercubit.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:flutter_application_4/services/weather_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('search city'),
        ),
        body: Center(
          child: TextField(
            onSubmitted: (value) async {
              var weathercubit = BlocProvider.of<Weathercubit>(context);
              weathercubit.getweather(city: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: 'search',
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.blueAccent,
              hintStyle: TextStyle(),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
            ),
          ),
        ));
  }
}
