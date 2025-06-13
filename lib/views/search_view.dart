import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Search City",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (String value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                hintText: 'Enter City Name',
                prefixIcon: Icon(Icons.location_city),
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
