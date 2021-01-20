import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Controller.dart';
import '../services/GetWeatherFetch.dart';
import 'dart:core';
import '../models/Weather.dart';

class MainScreen extends StatelessWidget {
  Size size = Get.mediaQuery.size;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller()); // State controller
    GetWeatherFetch.getWeather(
        lat: 55.751244,
        lon: 37.618423); // geting and writing answer like Json in state
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search_sharp,
                size: 30,
                color: Colors.grey,
              ),
              padding: EdgeInsets.only(right: 20),
              onPressed: null),
          IconButton(
              icon: const Icon(
                Icons.gps_fixed,
                size: 30,
                color: Colors.grey,
              ),
              tooltip: 'Show Snackbar',
              padding: EdgeInsets.only(right: 30),
              onPressed: null)
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
                          Text('10:00 pm',
                              style: TextStyle(
                                color: Color.fromRGBO(241, 104, 112, 0.4),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 30),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                              '10°',
                              style: TextStyle(
                                color: Color.fromRGBO(237, 56, 66, 0.7),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Rain',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: Image.asset(
                        'assets/rain.png',
                        height: size.width * 0.62,
                      ),
                    ),
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
                        child: Image.asset(
                          'assets/sun.png',
                          height: size.width * 0.32,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '24°',
                              style: TextStyle(
                                color: Color.fromRGBO(237, 56, 66, 0.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Sun',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                        child: Image.asset(
                          'assets/snow.png',
                          height: size.width * 0.32,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '-17°',
                              style: TextStyle(
                                color: Color.fromRGBO(237, 56, 66, 0.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Snow',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
        height: 60,
      ),
    );
  }
}

// Center(child: Obx(() => Text("Кликов: ${c.weather.value.name}"))),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => {c.weather(Weather(name: 'João'))},
//       ),
