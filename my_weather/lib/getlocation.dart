// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

class Getlocation {
  Future getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
      // print(" value of position is : $position");

      // gettemp(position.latitude, position.longitude);

      // getcity(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }
}
