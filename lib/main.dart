import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/database/weather.dart';

Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Minsk&appid=2e6117b75802a05e156e82f2eb68ccad'));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Weather> futureWeather;
  //int _selectItem = 0;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Weather>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                return Text(snapshot.data!.descrip);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  final int defaultIndex;

  NavBar({
    this.defaultIndex = 0,
  });

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectIndex = widget.defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      buildNavBarItem(Icons.wb_sunny_outlined, true, 0),
      buildNavBarItem(Icons.wb_twighlight, false, 1)
    ]);
  }

  Widget buildNavBarItem(IconData icon, bool choosen, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: index == _selectIndex ? Colors.amber[300] : Colors.amber[100],
        ),
        child: Icon(
          icon,
          color: index == _selectIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class LoadWeatherData extends StatefulWidget {
  const LoadWeatherData({Key? key}) : super(key: key);

  @override
  _LoadWeatherDataState createState() => _LoadWeatherDataState();
}

class _LoadWeatherDataState extends State<LoadWeatherData> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
