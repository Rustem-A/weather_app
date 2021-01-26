import 'package:get/get.dart';
import '../models/Weather.dart';

class Controller extends GetxController {
  var weather = Weather().obs;
  var latitude = '51.507359'.obs;
  var longitude = '-0.118092'.obs;
}
