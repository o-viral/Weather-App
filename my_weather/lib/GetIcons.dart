import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class GetIcons {
  static Icon getIcons(String icode) {
    if (icode == "01d") {
      return Icon(
        FontAwesomeIcons.solidSun,
        color: Colors.amber,
      );
    } else if (icode == "01n") {
      return Icon(
        FontAwesomeIcons.solidMoon,
        color: Colors.blue[400],
      );
    } else if (icode == "02d" || icode == "03d" || icode == "04d") {
      return Icon(FontAwesomeIcons.cloudSun, color: Colors.amber);
    } else if (icode == "02n" || icode == "03n" || icode == "04n") {
      return (Icon(FontAwesomeIcons.cloudMoon, color: Colors.blue[400]));
    } else if (icode == "09d") {
      return (Icon(FontAwesomeIcons.cloudSunRain, color: Colors.amber));
    } else if (icode == "09n") {
      return (Icon(
        FontAwesomeIcons.cloudMoonRain,
        color: Colors.blue[400],
      ));
    } else if (icode == "10d" ||
        icode == "10n" ||
        icode == "11d" ||
        icode == "11n") {
      return (Icon(FontAwesomeIcons.cloudShowersHeavy,
          color: Colors.blue[400]));
    } else if (icode == "13d" || icode == "13n") {
      return (Icon(
        FontAwesomeIcons.solidSnowflake,
        color: Colors.blue[400],
      ));
    } else if (icode == "50d") {
      return Icon(FontAwesomeIcons.cloudMeatball, color: Colors.blue[300]);
    }

    throw Exception("failed");
  }
}


// 01d.png 	01n.png 	clear sky
// 02d.png 	02n.png 	few clouds
// 03d.png 	03n.png 	scattered clouds
// 04d.png 	04n.png 	broken clouds
// 09d.png 	09n.png 	shower rain
// 10d.png 	10n.png 	rain
// 11d.png 	11n.png 	thunderstorm
// 13d.png 	13n.png 	snow
// 50d.png 	50n.png 	mist