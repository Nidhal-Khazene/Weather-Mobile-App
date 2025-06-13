import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return Center(
                child: Text(
              "Oops there was an error!",
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 32, color: Colors.red),
            ));
          }
        },
      ),
    );
  }
}
