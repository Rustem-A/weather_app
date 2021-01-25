import 'package:flutter/material.dart';
import 'package:weather_app/services/getWeatherFetch.dart';
import '../animations/OpacityAnimation.dart';
import '../services/getWeatherFetch.dart';

class InitialAnimateLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getWeatherFetch(lat: 51.507359, lon: -0.118092);
    return Scaffold(
      body: OpacityAnimation(),
    );
  }
}
