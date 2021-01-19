import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/Weather.dart';

class Controller extends GetxController {
  var weather = Weather().obs;
  setWeatherState(weather2) => weather = weather2;
}
