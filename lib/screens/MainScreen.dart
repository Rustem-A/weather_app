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
  var pos;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

    Widget curCity = Obx(() => Text(
          "${c.weather.value.city}",
          style: Theme.of(context).textTheme.headline4,
        ));

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Light Theme',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Get.changeThemeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Get.changeThemeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
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
              padding: EdgeInsets.only(right: 20),
              onPressed: () async {
                pos = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                if (pos != null) {
                  getWeatherFetch(lat: pos.latitude, lon: pos.longitude);
                }
              }),
          IconButton(
              icon: const Icon(
                Icons.refresh,
                size: 32,
                color: Colors.red,
              ),
              tooltip: 'Refresh',
              padding: EdgeInsets.only(right: 30),
              onPressed: () {
                getWeatherFetch(lat: pos.latitude, lon: pos.longitude);
              }),
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
                // color: Colors.white,
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
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Obx(() => Text(
                              "updated in ${new DateFormat.Hm().format(c.weather.value.lastUpdate)}",
                              style: TextStyle(
                                color: Color.fromRGBO(241, 104, 112, 0.4),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ))),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 30),
                        // color: Colors.white,
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
                          style: Theme.of(context).textTheme.headline6,
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
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: Theme.of(context).brightness.index == 0
                            ? BoxDecoration(
                                gradient: RadialGradient(
                                  center: Alignment.center,
                                  radius: 0.6,
                                  colors: [
                                    const Color.fromRGBO(111, 111, 111, 1),
                                    const Color.fromRGBO(75, 75, 75, 1),
                                  ],
                                  stops: [0.0, 0.9],
                                ),
                              )
                            : null,
                        width: size.width / 2,
                        child: InkWell(
                          onTap: () {
                            Get.to(SevenDaysScreen());
                          },
                          child: Container(
                            child: Image.asset(
                              'assets/week.png',
                              scale: 1.4,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
