class Weather {
  final String location;
  final double temp;
  final int humidity;
  final int pressure;
  final double speed;
  final String descrip;

  Weather(
      {required this.location,
      required this.temp,
      required this.humidity,
      required this.pressure,
      required this.speed,
      required this.descrip}
      );

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['name'],
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      speed: json['wind']['speed'],
      descrip: json['weather'][0]['description'],
    );
  }
}
