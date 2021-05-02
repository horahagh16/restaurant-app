import 'package:flutter/cupertino.dart';
import 'package:snappfood_app/Restaurant.dart';
import 'package:snappfood_app/Reataurants.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/FoodCategory.dart';
import 'package:snappfood_app/colors_program.dart';

import 'FoodCategory.dart';
import 'FoodCategory.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool is_alreadyused(int number,List <Restaurant> list){
    bool status=false;
    if (list.contains(number))
    {
      status=true;
    }
    return status;
  }
  bool is_correct(String password){
    bool status=true;

  }
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  var _formkey = GlobalKey<FormState>();
  int _value = 1;
  String name;
  String address;
  FoodCategory kind;
  int phone_number;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(" Sign up"),
          backgroundColor: bar,
    ),

    body: Container(
      child: ListView(
      children: [
      TextFormField(
            decoration:  InputDecoration(
            hintText: 'Name:'
          ),
          onSaved:(String value){
            name =value;
          },
          validator: (String value){
          if(value.isEmpty || value==null)
          {
          return " Incomplete field";
          }
          return null;
          },
    ),
    TextFormField(
          decoration:  InputDecoration(
          hintText: 'Address:'
          ),
          onSaved:(String value){
            address=value;
          },
          validator: (String value){
          if(value.isEmpty || value==null)
          {
          return " Incomplete field";
          }
          return null;
          },
    ),
    Container(
      padding: EdgeInsets.all(20.0),
      child:DropdownButton<FoodCategory>(
          value: FoodCategory,
          onChanged: (FoodCategory newValue) {
            setState(() {
                kind = newValue;
            });
          },
          items: <FoodCategory>[
            FoodCategory.Fastfood,
            FoodCategory.Seafood,
            FoodCategory.International,
            FoodCategory.Iranian,
            FoodCategory.Vegeterianfood,
            FoodCategory.Others,
          ].map((FoodCategory FoodCategory) {
            return new DropdownMenuItem<FoodCategory>(
               value: FoodCategory,
                child: new Text(FoodCategory.toString()));
          }).toList(),
      )
    ),
    TextFormField(
          decoration:  InputDecoration(
          hintText: 'Phone_Number:'
          ),
          onSaved:(String value){
          phone_number=int.parse(value);
          },
          validator: (String value){
          if(value.isEmpty || value==null)
          {
          return " Incomplete field";
          }
          if(int.parse(value) is int==false)
          {
          return"please enter numbers";
          }
          if(is_alreadyused(phone_number, Restaurants.restaurants) ==true)
            {
            return"Someone alraedy used this number";
            }
          if(phone_number.toString().length !=11)
            {
            return"please enter 11 numbers";
            }
          return null;
          },
    ),
        TextFormField(
          decoration:const  InputDecoration(
              hintText: 'Password:',
              icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(Icons.lock))),
          onSaved:(String value){
            address=value;

          },
          obscureText: _obscureText,
          validator: (String value){
            if(value.isEmpty || value==null)
            {
              return " Incomplete field";
            }
            if(value.length<6)
              {
                return"Password too short.";
              }
            return null;
          },

        ),
        new FlatButton(
            onPressed: _toggle,
            child: new  Text(_obscureText ? "Show" : "Hide")),

        Container(
          margin: EdgeInsets.all(25),
          color: ok,
          child:  FlatButton(
              onPressed: (){
                if(_formkey.currentState.validate()){
                  setState(() {
                    _formkey.currentState.save();
                    Restaurants.restaurants.add(Restaurant(name,address,kind,phone_number,password));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Add")
          ),
        )

      ],
    ),
    ),

    );

  }
}
