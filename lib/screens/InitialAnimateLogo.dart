import 'package:flutter/material.dart';
import '../animations/OpacityAnimation.dart';
import '../controllers/Controller.dart';
import '../services/GetWeatherFetch.dart';
import 'package:get/get.dart';

class InitialAnimateLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller()); // State controller
    GetWeatherFetch.getWeather(lat: 55.751244, lon: 37.618423);
    return Scaffold(
      body: OpacityAnimation(),
    );
  }
}
