import 'dart:convert';
import 'dart:ffi';

import 'package:farmer_app/main.dart';
import 'package:farmer_app/src/model/clouds.dart';
import 'package:farmer_app/src/model/coord.dart';
import 'package:farmer_app/src/model/main_weather.dart';
import 'package:farmer_app/src/model/sys.dart';
import 'package:farmer_app/src/model/wind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '/src/model/current_weather_data.dart';
import '/src/model/five_days_data.dart';
import '/src/service/weather_service.dart';

class HomeController extends GetxController {
  String city;
  String searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData(
    base: '',
    cod: 0,
    id: 0,
    timezone: 0,
    visibility: 0,
    dt: 0,
    name: '',
    clouds: Clouds(all: 0),
    wind: Wind(speed: 0, deg: 0),
    main: MainWeather(
        temp: 273,
        feelsLike: 0,
        tempMin: 0,
        tempMax: 0,
        pressure: 0,
        humidity: 0),
    coord: Coord(lon: 0, lat: 0),
    sys: Sys(type: 0, id: 0, country: '', sunrise: 0, sunset: 0),
    weather: [],
    //main: , sys: , coord: , weather: [], wind:
  );
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city, required this.searchText});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
              print(error),
              update(),
            },
        beforSend: () {});
  }

  void getTopFiveCities() {
    List<String> cities = [
      'Mumbai',
      'Chennai',
      'New Delhi',
      'Kochi',
      'Hyderabad'
    ];
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(
          onSuccess: (data) {
            dataList.add(data);
            update();
          },
          onError: (error) {
            print(error);
            update();
          },
          beforSend: () {});
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        },
        beforSend: () {});
  }
}
