// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_weather/HttpHandler.dart';
import 'package:my_weather/weatherdata.dart';
// import 'package:my_weather_app/GetIcons.dart';
import 'GetIcons.dart';
import 'HttpHandler.dart';
// import 'package:my_weather_app/HttpHandler.dart';
// import 'package:my_weather_app/weatherdata.dart';
// import 'GetIcons.dart';
// import 'main.dart';

class DisplayWeatherData extends StatelessWidget {
  static Future<Weatherdata>? _getweatherdata;

  //  DisplayWeatherData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getweatherdata = HttpHandler.gettemp();
    return FutureBuilder<Weatherdata>(
      future: _getweatherdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "HELLO! YOU ARE IN:",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontFamily: "MomcakeBold-WyonA",
                        fontSize: 30.0,
                        color: Colors.blueGrey[900]),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 110.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "${snapshot.data!.city}",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: "MomcakeBold-WyonA",
                            fontSize: 30.0,
                            color: Colors.blueGrey[900]),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 100.0),
                child: ListTile(
                  leading: GetIcons.getIcons("${snapshot.data!.icon}"),
                  title: Text("Temprartue ${snapshot.data!.temp} C",
                      style: TextStyle(
                          fontFamily: "MomcakeBold-WyonA",
                          fontWeight: FontWeight.w800)),
                  subtitle: Text(
                      "${snapshot.data!.description}, Humidity: ${snapshot.data!.humidity} , Country: ${snapshot.data!.country}"),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
