import 'package:get/get.dart';
import '../models/Weather.dart';

class Controller extends GetxController {
  var weather = Weather().obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
}
