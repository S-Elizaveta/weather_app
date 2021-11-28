import 'package:flutter/material.dart';

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
      required this.descrip}
      );

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
            Text('$location',
                style: Theme.of(context).textTheme.headline1),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$temp℃',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('|'),
                  ),
                  Text(
                    '$descrip',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WeatherCard(icon: Icons.bubble_chart_outlined, title: '$humidity'),
                  WeatherCard(icon: Icons.waves_outlined, title: '$pressure'),
                  WeatherCard(icon: Icons.air_outlined, title: '$speed'),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 60,
              endIndent: 60,
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


class WeatherCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const WeatherCard({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.amber),
          Text(
            '$title',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
