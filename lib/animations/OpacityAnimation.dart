import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/MainScreen.dart';

class OpacityAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return Container(
      alignment: Alignment.center,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 5),
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: Image.asset(
              'assets/logo.png',
              height: size.width * 0.32,
            ),
          );
        },
        onEnd: () => {Get.off(MainScreen())},
      ),
    );
  }
}
