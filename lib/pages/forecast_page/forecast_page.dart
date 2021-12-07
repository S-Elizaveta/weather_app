import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/database/weather.dart';

class ForecastPage extends StatefulWidget {
  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
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
        title: Text('Forecast'),
      ),
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ForecastBodyInfo(
                temp: double.parse(
                    (snapshot.data!.temp - 273).toStringAsFixed(2)),
                descrip: snapshot.data!.descrip);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}

class ForecastBodyInfo extends StatelessWidget {
  final double temp;
  final String descrip;

  ForecastBodyInfo({required this.temp, required this.descrip});

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
            Expanded(
              child: ListView(
                children: [
                  WeatherTile(
                    icon: Icons.ac_unit_outlined,
                    title: '10:00',
                    subtitle: '$descrip',
                    trailing: '$temp',
                  ),
                  WeatherTile(
                    icon: Icons.ac_unit_outlined,
                    title: '13:00',
                    subtitle: '$descrip',
                    trailing: '$temp',
                  ),
                  WeatherTile(
                    icon: Icons.ac_unit_outlined,
                    title: '16:00',
                    subtitle: '$descrip',
                    trailing: '$temp',
                  ),
                  WeatherTile(
                    icon: Icons.ac_unit_outlined,
                    title: '19:00',
                    subtitle: '$descrip',
                    trailing: '$temp',
                  ),
                  WeatherTile(
                    icon: Icons.ac_unit_outlined,
                    title: '22:00',
                    subtitle: '$descrip',
                    trailing: '$temp',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WeatherTile extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;
  String trailing;

  WeatherTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber, size: 50,),
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        '$subtitle',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Text(
        '$trailing℃',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
