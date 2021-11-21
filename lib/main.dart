import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  //int _selectItem = 0;
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
            Text(
              'Weather',
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
