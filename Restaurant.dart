import 'package:flutter/material.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/FoodCategory.dart';
import 'package:snappfood_app/Reataurants.dart';
class Restaurant{
  String name;
  String address;
  FoodCategory kind;
  int phone_number;
  String password;
Restaurant(String name,String address,FoodCategory kind,int phone_number,String password){
  this.name=name;
  this.address;
  this.kind=kind;
  this.phone_number=phone_number;
  this.password=password;
}

  String getName(){
    return name;
  }
  String getAddress(){
    return address;
  }
  FoodCategory getKind(){
  return kind;
  }
  int getPhoneNumber(){
  return phone_number;
  }
  String getPassword(){
    return password;
  }

}