import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';
import '../services/GetWeatherFetch.dart';
import 'dart:core';
import '../models/Weather.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    GetWeatherFetch.getWeather(lat: 55.751244, lon: 37.618423);
    return Scaffold(
        body: Center(child: Obx(() => Text("Кликов: ${c.weather.value.name}"))),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            c.weather(Weather(name: 'João'))
          },
          ),
        );
  }
}
