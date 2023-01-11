class MainWeather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainWeather(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  factory MainWeather.fromJson(dynamic json) {
    // if (json == null) {
    //   return MainWeather();
    // }

    return MainWeather(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
