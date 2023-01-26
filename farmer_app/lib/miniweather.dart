import 'dart:convert';
import 'currentweather.dart';
import 'package:farmer_app/src/model/weather2.dart';
import 'package:farmer_app/src/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'src/model/weather2.dart';
import 'package:http/http.dart' as http;

class MiniWeather extends StatefulWidget {
  const MiniWeather({super.key});

  @override
  State<MiniWeather> createState() => _MiniWeatherState();
}

class _MiniWeatherState extends State<MiniWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      body: const CurrentWeatherPage(),
    );
  }
}
