class Weather {
  final int temp;
  final int humidity;
  final double pressure;
  final double speed;
  final String descrip;

  Weather(
      {required this.temp,
      required this.humidity,
      required this.pressure,
      required this.speed,
      required this.descrip});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      speed: json['wind']['speed'],
      descrip: json['weather']['description'],
    );
  }
}
