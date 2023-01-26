import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'src/model/weather2.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot != null) {
              Weather2 _weather = snapshot.data;
              if (_weather == null)
                return weatherBox(_weather);
              //return Text("Error getting weather");
              else
                return weatherBox(_weather);
              // }
            } else {
              return CircularProgressIndicator();
            }
          },
          future: getCurrentWeather2(),
        ),
      ),
    );
  }
}

Widget weatherBox(Weather2 _weather) {
  return Column(
    children: [
      Text("${_weather.temp}°C"),
      Text("${_weather.description}"),
      Text("Feels:${_weather.feelsLike}°C"),
      Text("H:${_weather.high}°C L:${_weather.low}°C"),
    ],
  );
}

Future getCurrentWeather2() async {
  Weather2 weather;
  String city = "Bengaluru";
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=bdb1ddfa801062ec7cef442bcffa3f1f';
  var url = "$baseUrl/weather?q=$city&lang=en&$apiKey&units=metric";

  final response = await http.get(Uri.parse(url));

  //if (response.statusCode == 200) {
  weather = Weather2.fromJson(jsonDecode(response.body));
  //} else {
  // TODO: Throw error here
  //}
}
