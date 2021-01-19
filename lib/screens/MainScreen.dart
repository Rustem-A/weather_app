import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';

class MainScreen extends StatelessWidget {
  var s = Get.mediaQuery.size.width;
  @override
  Widget build(BuildContext context) {
    Get.back();
    return Container(
      child: Text("$s"),
    );
  }
}
