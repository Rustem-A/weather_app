import 'package:flutter/material.dart';
import 'package:weather_app/services/getWeatherFetch.dart';
import '../animations/OpacityAnimation.dart';
import '../services/getWeatherFetch.dart';
import '../controllers/Controller.dart';
import 'package:get/get.dart';

class InitialAnimateLogo extends StatelessWidget {
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    getWeatherFetch(
        lat: double.parse(c.latitude.value),
        lon: double.parse(c.longitude.value));
    return Scaffold(
      body: OpacityAnimation(),
    );
  }
}
