import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetWeatherFetch {
  final double lon;
  final double lat;

  GetWeatherFetch({@required double this.lon, @required double this.lat});

  static getWeather() {
    var url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=55.751244&lon=37.618423&exclude=minutely,hourly,alerts&appid=a1c48f3530ceac2147e5c5478acd649c';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
