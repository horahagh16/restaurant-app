import 'package:flutter/material.dart';
import 'dart:io';
import 'package:restaurant_app/modals/Restaurant.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/screens/loginScreen.dart';
import 'package:restaurant_app/modals/Food.dart';

void main() {
  Restaurants.add(
      Restaurant("Farsi", 'dolat', ["iranian"], "09123456789", "abc1234"));
  Restaurants.restaurants
      .elementAt(0)
      .menu
      .add(Food("kabab koubide", "beef", 800000, "main course"));
  Restaurants.add(Restaurant(
      "Perperook", 'pasdaran', ["fastfood"], "09121234567", "def1234"));
  Restaurants.add(
      Restaurant("Nayeb", 'niavaran', ["iranian"], "09121231212", "ghi1234"));

  Restaurants.restaurants
      .elementAt(1)
      .menu
      .add(Food("French fries", "potato", 10000, "dessert"));
  Restaurants.restaurants
      .elementAt(1)
      .menu
      .add(Food("Caesar salad", "chicken,lettuce,...", 40000, "all"));
  Restaurants.restaurants
      .elementAt(2)
      .menu
      .add(Food("Mashroom soup", "chicken,mashroom,...", 40000, "appetiezer"));
  isConnect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: PopupDialog(),
    );
  }
}

void isConnect() async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected to server');
    serverSocket.writeln('restaurant connected to server');
  });
}
