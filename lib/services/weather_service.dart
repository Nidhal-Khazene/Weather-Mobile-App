import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "26c7a95963934334891172305250806";
  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "Oops there was an error, try later!";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops there was an error, try later!");
    }
  }
}
