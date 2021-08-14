import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:my_weather_app/DisplayWeatherdata.dart';
import 'DisplayWeatherdata.dart';
// import 'DisplayWeatherdata.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _DisplayWeatherData = DisplayWeatherData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: displayback(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40.0),
                    child: displayimage(),
                  ),
                ),
                Container(
                  child: _DisplayWeatherData,
                )
              ],
            ),
          ),
        ));
  }

  // display image based on current time
  displayimage() {
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);
    final currentdate = DateFormat.yMMMMd().format(now);

    if (currentTime.contains("PM")) {
      return Image.network(
        "https://media.giphy.com/media/l3q2sZfD4v4lgrBGU/giphy.gif",
      );
    } else if (currentTime.contains("AM")) {
      return Image.asset("images/day.jpg");
    }
  }

  displayback() {
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);
    final currentdate = DateFormat.yMMMMd().format(now);

    if (currentTime.contains("AM")) {
      return (Colors.blue[100]);
    } else if (currentTime.contains("PM")) {
      return (Colors.grey[600]);
    }
  }
}
