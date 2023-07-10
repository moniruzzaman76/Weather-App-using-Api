import 'package:flutter/material.dart';
import 'package:weather/Api/api_service.dart';
import 'package:weather/Api/model_class.dart';
import 'package:weather/todays_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade400,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text("Weather App"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
        body: FutureBuilder(
          future: apiService.getWeatherData("Dhaka"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return  TodayWeather(weatherModel: weatherModel);
            }
            if (snapshot.hasError) {
              return  Center(
                child: Text("${snapshot.error} occurred"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
