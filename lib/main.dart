import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                  builder: (context, sate) {
                return MaterialApp(
                  theme: ThemeData(
                      useMaterial3: false,
                      primarySwatch: getThemeColor(
                          BlocProvider.of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.weatherCondition)),
                  debugShowCheckedModeBanner: false,
                  home: HomeView(),
                );
              })),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // Clear/Sunny conditions
    case 'sunny':
    case 'clear':
      return Colors.amber;

    // Partly cloudy conditions
    case 'partly cloudy':
      return Colors.orange;

    // Cloudy conditions
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    // Mist and fog conditions
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    // Light rain conditions
    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'light rain shower':
      return Colors.lightBlue;

    // Moderate rain conditions
    case 'moderate rain at times':
    case 'moderate rain':
    case 'moderate or heavy rain shower':
      return Colors.red;

    // Heavy rain conditions
    case 'heavy rain at times':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.indigo;

    // Freezing rain/drizzle conditions
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.cyan;

    // Snow conditions
    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'blowing snow':
    case 'blizzard':
      return Colors.blue;

    // Sleet conditions
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.teal;

    // Ice pellets
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;

    // Thunder conditions
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    // Default fallback
    default:
      return Colors.blue;
  }
}
