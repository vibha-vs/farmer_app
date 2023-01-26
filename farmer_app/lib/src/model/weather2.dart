class Weather2 {
  final double? temp;
  final double? feelsLike;
  final double? low;
  final double? high;
  final double? description;

  Weather2(
      {required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description});

  factory Weather2.fromJson(Map<String, dynamic> json) {
    return Weather2(
      temp: json['main']['temp']!,
      feelsLike: json['main']['feels_like']!,
      low: json['main']['low']!,
      high: json['main']['high']!,
      description: json['main']['description']!,
    );
  }
}
