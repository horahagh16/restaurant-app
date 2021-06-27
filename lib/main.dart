import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/Home.dart';
import 'dart:io';
import 'package:restaurant_app/modals/Restaurant.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/screens/loginScreen.dart';
import 'package:restaurant_app/modals/Food.dart';

void main() {
  Restaurants.add(
      Restaurant("farsi", 'dolat', ["iranian"], "09123456789", "abc1234"));
  Restaurants.restaurants
      .elementAt(0)
      .menu
      .add(Food("kabab", "kobide", 200000, "main course"));
  Restaurants.add(Restaurant(
      "perperook", 'pasdaran', ["fastfood"], "09121234567", "def1234"));
  Restaurants.add(
      Restaurant("nayeb", 'niavaran', ["iranian"], "09121231212", "ghi1234"));

  Restaurants.restaurants
      .elementAt(1)
      .menu
      .add(Food("french fries", "mini size", 10000, "dessert"));
  Restaurants.restaurants
      .elementAt(2)
      .menu
      .add(Food("mashroom soup", "kobide", 200000, "appetiezer"));
   send();
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

void send() async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected');
    String str = "";
    String address = "";
    String name = "";
    String phoneNumber = "";
    String pass = "";
    /*String farman="AddCustomer-sm-09122221122-pass123-oonja-famil";
    serverSocket.writeln(farman);
    serverSocket.writeln("login");
    serverSocket.listen((socket) {
      str = String.fromCharCodes(socket).trim();
      print(str);
      var string = str.split("-");
      name = string[0];
      address = string[1];
      phoneNumber = string[2];
      pass = string[3];
      Restaurants.add(
          Restaurant(name, address, ["iranian"], phoneNumber, pass));
      print(Restaurants.restaurants.last.name);
      print(Restaurants.restaurants.last.address);
      print(Restaurants.restaurants.last.password);
    });
    Restaurants.add(restaurant());*/
  });
}
