import 'package:get/get.dart';

class Controller extends GetxController {
  var opacity = 0.0.obs;
  makeZero() => opacity.value = 0.0;
}
