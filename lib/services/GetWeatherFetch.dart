import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../controllers/Controller.dart';
import 'package:flutter/foundation.dart';
import '../models/Weather.dart';

class GetWeatherFetch {
  // final double lon;
  // final double lat;

  // GetWeatherFetch({@required double this.lon, @required double this.lat});

  static getWeather({@required double lat, @required double lon}) async {
    final Controller c = Get.find();
    var url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly,alerts&appid=a1c48f3530ceac2147e5c5478acd649c";
    var response = await http.get(url);
    // if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var data = Weather.fromJson(jsonResponse);
    debugPrint(jsonResponse['timezone']);
    c.weather.value = data;
    // Controller.setWeatherState(jsonResponse);
    // } else {}
  }
}
