class Weather {
  final double temp;
  final double low;
  final double high;
  final String descrip;

  Weather(
      {required this.temp,
      required this.low,
      required this.high,
      required this.descrip});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      low: json['main']['low_temp'].toDouble(),
      high: json['main']['high_temp'].toDouble(),
      descrip: json['main'][0]['description'].toDouble(),
    );
  }
}
