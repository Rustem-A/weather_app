import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../controllers/Controller.dart';
import 'package:flutter/foundation.dart';
import '../models/Weather.dart';

dynamic getWeatherFetch({@required double lat, @required double lon}) async {
  final Controller c = Get.find();
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly,alerts&units=metric&appid=a1c48f3530ceac2147e5c5478acd649c";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    dynamic jsonResponse = convert.jsonDecode(response.body);
    Weather data = Weather.fromJson(jsonResponse);
    c.weather.value = data;
  } else {}
}
