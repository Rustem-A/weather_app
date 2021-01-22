import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import '../services/getCurImage.dart';

class SevenDaysScreen extends StatelessWidget {
  Controller c = Get.find();
  Size size = Get.mediaQuery.size;
  String getDate(timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      timestamp * 1000,
      isUtc: false,
    );
    String day = DateFormat('EEEE').format(date);
    return day;
  }

  List<Widget> dailyBulder() {
    List<Widget> res = <Widget>[];

    for (var i = 1; i <= 7; i++) {
      res.add(Container(
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Container(
                    child: Text(
                      "${getDate(c.weather.value.daily[i]['dt'])}",
                      style: TextStyle(
                        color: Color.fromRGBO(237, 56, 66, 0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(() => Text(
                      "${c.weather.value.daily[i]['temp']['day']}°",
                      style: TextStyle(
                        color: Color.fromRGBO(237, 56, 66, 0.7),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Obx(() => Text(
                      '${c.weather.value.daily[i]['weather'][0]['main']}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            )),
            Image.asset(
              "assets/${getCurImage(c.weather.value.daily[i]['weather'][0]['main'])}.png",
              height: size.width * 0.62,
            ),
          ],
        ),
      ));
      res.add(Divider());
      debugPrint(i.toString());
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var daily = c.weather.value.daily;
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: dailyBulder(),
      ),
    );
  }
}
