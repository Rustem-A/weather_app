import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';
import '../services/GetWeatherFetch.dart';
import 'dart:core';
import '../models/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import '../screens/SevenDaysScreen.dart';
import '../services/getCurImage.dart';

class MainScreen extends StatelessWidget {
  var pos;
  Size size = Get.mediaQuery.size;
  showAlertDialog(BuildContext context, main) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("$main"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                pos = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                if (pos != null) {
                  GetWeatherFetch.getWeather(
                      lat: pos.latitude, lon: pos.longitude);
                }
                if (pos != null) {
                  GetWeatherFetch.getWeather(
                      lat: pos.latitude, lon: pos.longitude);
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
                              "обновленно в ${c.weather.value.lastUpdate.hour}:${c.weather.value.lastUpdate.minute}",
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
                              // height: size.width * 0.32,
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
                                // height: size.width * 0.32,
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
                      // padding: EdgeInsets.only(top: 67, bottom: 67),
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
