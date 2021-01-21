import 'package:flutter/foundation.dart';

class Weather {
  Map<String, dynamic> current;
  DateTime lastUpdate;
  Map<String, dynamic> tommorow;
  String tommorowDesc;
  String todayDesc;
  var tomDate;

  Weather({
    this.current,
    this.lastUpdate,
    this.tommorow,
    this.tommorowDesc,
    this.tomDate,
    this.todayDesc,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      current: json['current'],
      lastUpdate: new DateTime.fromMillisecondsSinceEpoch(
        json['current']['dt'] * 1000,
        isUtc: false,
      ),
      todayDesc: json['current']['weather'][0]['main'],
      tommorow: json['daily'][1],
      tomDate: new DateTime.fromMillisecondsSinceEpoch(
        json['daily'][1]['dt'] * 1000,
        isUtc: false,
      ),
      tommorowDesc: json['daily'][1]['weather'][0]['main'],
    );
  }
}
