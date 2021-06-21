import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/Home.dart';
import 'dart:io';
import 'package:restaurant_app/modals/Restaurant.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/screens/loginScreen.dart';
void main() {
  Restaurants.add(
      Restaurant("farsi", 'dolat', ["iranian"], "09123456789", "abc1234"));
  Restaurants.add(Restaurant(
      "perperook", 'pasdaran', ["fastfood"], "09121234567", "def1234"));
  Restaurants.add(
      Restaurant("nayeb", 'niavaran', ["iranian"], "09121231212", "ghi1234"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: PopupDialog(),
    );
  }
}
