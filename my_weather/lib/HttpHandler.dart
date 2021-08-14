import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
// import 'package:my_weather_app/weatherdata.dart';
import 'weatherdata.dart';
import 'dart:convert';
import 'getlocation.dart';

class HttpHandler {
  static const String _apikey = "68a7c4bdec084be6db6940457e576566";
  static Getlocation _getlocation = Getlocation();

  static Future<Weatherdata> gettemp() async {
    var _getlatlon = await _getlocation.getcurrentlocation();

    if (_getlatlon != null) {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=${_getlatlon.latitude}&lon=${_getlatlon.longitude}&appid=$_apikey&units=metric"));
      if (response.statusCode == 200) {
        return Weatherdata.fromJSON(json.decode(response.body));
      } else {
        throw Exception("failed to fetch Weather Data");
      }
    }
    throw Exception("failed");
  }
}
