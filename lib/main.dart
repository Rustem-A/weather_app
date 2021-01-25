import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/InitialAnimateLogo.dart';
import './controllers/Controller.dart';
import './themes/themes.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "WeatherApp",
      debugShowCheckedModeBanner: false,
      theme: lighttheme(),
      darkTheme: darktheme(),
      themeMode: ThemeMode.light,
      home: InitialAnimateLogo(),
    );
  }
}
