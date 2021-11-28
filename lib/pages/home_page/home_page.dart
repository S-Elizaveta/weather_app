import 'package:flutter/material.dart';
import 'package:weather_app/database/weather.dart';
import 'package:weather_app/pages/homepage/infoAboutWeather.dart';
import 'package:weather_app/main.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late Future<Weather> futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.amber,
                  Colors.yellow,
                ],
              )),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title: Text('Today'),
      ),
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AboutWeather(
                location: snapshot.data!.location,
                temp: double.parse(
                    (snapshot.data!.temp - 273).toStringAsFixed(2)),
                humidity: snapshot.data!.humidity,
                pressure: snapshot.data!.pressure,
                speed: snapshot.data!.speed,
                descrip: snapshot.data!.descrip);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
