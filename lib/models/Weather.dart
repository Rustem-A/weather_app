import 'package:flutter/foundation.dart';

class Weather {
  String name;

  // Weather({this.date, this.name, this.temp, this.main, this.icon});
  Weather({this.name});

  factory Weather.fromJson(Map<String, dynamic> json) {
    
    debugPrint(json['timezone']);
    return Weather(
      // date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
      //     isUtc: false),
      name: json['timezone'],
      // temp: json['main']['temp'].toDouble(),
      // main: json['weather'][0]['main'],
      // icon: json['weather'][0]['icon'],
    );
  }
}