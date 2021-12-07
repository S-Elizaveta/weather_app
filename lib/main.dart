import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/pages/forecast_page/forecast_page.dart';

import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:weather_app/database/weather.dart';

Future<Weather> fetchWeather() async {
  final location = 'Minsk';
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2e6117b75802a05e156e82f2eb68ccad'));

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
          primaryColor: Colors.yellow,
          highlightColor: Color.fromRGBO(0, 205, 190, 4),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            bodyText2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(0, 205, 190, 4),
            ),
            button: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(204, 170, 0, 4),
            ),
          )),
      home: MainAppPage(),
    );
  }
}

class MainAppPage extends StatefulWidget {
  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _selectItem = 0;

  final screens = [
    WeatherHomePage(),
    ForecastPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectItem,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_outlined), label: 'Today'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wb_twighlight,
              ),
              label: 'Forecast')
        ],
        backgroundColor: Colors.amber[300],
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectItem = index;
          });
        },
      ),
    );

  }
}