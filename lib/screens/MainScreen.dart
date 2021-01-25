import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';
import '../services/getWeatherFetch.dart';
import 'dart:core';
import 'package:geolocator/geolocator.dart';
import '../screens/SevenDaysScreen.dart';
import '../services/getCurImage.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {
  final Size size = Get.mediaQuery.size;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

    Widget curCity = Obx(() => Text(
          "${c.weather.value.city}",
          style: TextStyle(
            fontSize: 30,
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: curCity,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.gps_fixed,
                size: 32,
                color: Colors.red,
              ),
              tooltip: 'Get Geololocation',
              padding: EdgeInsets.only(right: 30),
              onPressed: () async {
                var pos = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                if (pos != null) {
                  getWeatherFetch(lat: pos.latitude, lon: pos.longitude);
                }
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromRGBO(127, 127, 127, 0.3)),
              )),
              height: size.height / 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 20, left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(() => Text(
                              "обновленно в ${new DateFormat.Hm().format(c.weather.value.lastUpdate)}",
                              style: TextStyle(
                                color: Color.fromRGBO(241, 104, 112, 0.4),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ))),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 30),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Obx(() => Text(
                                  "${c.weather.value.current['temp']}°",
                                  style: TextStyle(
                                    color: Color.fromRGBO(237, 56, 66, 0.7),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Obx(() => Text(
                                  '${c.weather.value.todayDesc}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        )),
                    Container(
                        child: Obx(() => Image.asset(
                              "assets/${getCurImage(c.weather.value.todayDesc)}.png",
                            ))),
                  ],
                ),
              )),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: size.width / 2,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Tomorrow',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          child: Obx(() => Image.asset(
                                "assets/${getCurImage(c.weather.value.tommorowDesc)}.png",
                              ))),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => Text(
                                  '${c.weather.value.tommorow['temp']['day']}°',
                                  style: TextStyle(
                                    color: Color.fromRGBO(237, 56, 66, 0.7),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Obx(() => Text(
                                  '${c.weather.value.tommorowDesc}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width / 2,
                  child: InkWell(
                    onTap: () {
                      Get.to(SevenDaysScreen());
                    },
                    child: Container(
                      child: Image.asset(
                        'assets/week.png',
                        height: size.width * 0.32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
          top:
              BorderSide(width: 1.0, color: Color.fromRGBO(127, 127, 127, 0.3)),
        )),
        height: 50,
      ),
    );
  }
}
