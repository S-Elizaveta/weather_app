import 'package:flutter/material.dart';
import 'package:weather_app/database/weather.dart';

class AboutWeather extends StatelessWidget {
  final String location;
  final double temp;
  final int humidity;
  final int pressure;
  final double speed;
  final String descrip;

  AboutWeather(
      {required this.location,
      required this.temp,
      required this.humidity,
      required this.pressure,
      required this.speed,
      required this.descrip});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text('$location',
                      style: Theme.of(context).textTheme.headline1),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    '$temp',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(height: 5,),
                  Text(
                    '$descrip',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.vertical,
                children: [
                  WeatherTile(
                      icon: Icons.bubble_chart_outlined,
                      title: '$humidity'),
                  WeatherTile(
                      icon: Icons.waves_outlined, title: '$pressure'),
                  WeatherTile(icon: Icons.air_outlined, title: '$speed'),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('Share', style: Theme.of(context).textTheme.button))
          ],
        ),
      ),
    );
  }
}

class WeatherTile extends StatelessWidget {
  IconData icon;
  String title;

  WeatherTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.amber),
        ],
      ),
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
