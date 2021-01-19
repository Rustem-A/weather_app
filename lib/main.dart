import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/InitialAnimateLogo.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "WeatherApp",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: InitialAnimateLogo(), //srceens
    );
  }
}
