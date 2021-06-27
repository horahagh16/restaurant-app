import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/Restaurant.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/modals/constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Home.dart';
import 'mainPanel.dart';

int index;

class PopupDialog extends StatefulWidget {
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool is_alreadyused(String number, List<Restaurant> list) {
    bool status = false;
    for (Restaurant res in list) {
      if (res.phoneNumber.contains(number)) status = true;
    }
    return status;
  }

  String validatePassword(String pass) {
    String pattern = r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(pass)) {
      return 'invalid password';
    } else
      return null;
  }

  bool is_passCorrect(String number, String pass, List<Restaurant> list) {
    bool status = false;
    /*if (list.contains(number) && list.contains(pass)) {
      status = true;
    }*/
    for (Restaurant res in list) {
      if (res.phoneNumber.contains(number) && res.password.contains(pass))
        status = true;
    }
    return status;
  }

  bool is_correct(String password) {
    bool status = true;
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  int phone_number;
  List kind = List.empty(growable: true);
  TextEditingController pass;
  TextEditingController phoneNumber;
  TextEditingController restaurantName;
  TextEditingController address;

  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  bool s4 = false;
  bool s5 = false;
  bool s6 = false;
  String resKind;

  @override
  void initState() {
    pass = TextEditingController();
    phoneNumber = TextEditingController();
    restaurantName = TextEditingController();
    address = TextEditingController();
    super.initState();
  }

  void dispose() {
    phoneNumber.dispose();
    pass.dispose();
    address.dispose();
    restaurantName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: IconButton(
                  onPressed: () => _onAlertButtonsPressed(context),
                  icon: Icon(Icons.restaurant_menu),
                  color: Colors.red,
                  iconSize: 100,
                  disabledColor: Colors.white),
              shape: CircleBorder(),
            ),
            Text("\nTAP TO ENJOY",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30)),
          ],
        ),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Already have an account?",
      buttons: [
        DialogButton(
          child: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => _onAlertWithCustomContentPressed2(context),
          gradient: LinearGradient(colors: [
            Color(0xff00FF00),
            Color.fromRGBO(0, 179, 134, 1.0),
          ]),
        ),
        DialogButton(
          child: Text(
            "REGISTER",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => _onAlertWithCustomContentPressed(context),
          gradient: LinearGradient(colors: [
            Colors.green[900],
            Colors.greenAccent[400],
          ]),
        )
      ],
    ).show();
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "REGISTER",
        content: Column(
          children: <Widget>[
            TextField(
              controller: restaurantName,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                ),
                labelText: 'Restaurant Name',
              ),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                fillColor: Colors.deepOrangeAccent[400],
                icon: Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                labelText: 'address',
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Food Categories:',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Wrap(
              spacing: 2.0, // gap between adjacent chips
              runSpacing: 2.0,
              children: [
                FilterChip(
                  label: Text('FastFood'),
                  onSelected: (bool value) {
                    kind.add("FastFood");
                    setState(() {
                      s1 = !s1;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s1,
                  selectedColor: Colors.greenAccent,
                ),
                FilterChip(
                  label: Text('Iranian'),
                  onSelected: (bool value) {
                    kind.add("Iranian");
                    setState(() {
                      s2 = !s2;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s2,
                  selectedColor: Colors.greenAccent,
                ),
                FilterChip(
                  label: Text('Italian'),
                  onSelected: (bool value) {
                    kind.add("Italian");
                    setState(() {
                      s3 = !s3;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s3,
                  selectedColor: Colors.greenAccent,
                ),
                FilterChip(
                  label: Text('Seafood'),
                  onSelected: (bool value) {
                    kind.add("Seafood");
                    setState(() {
                      s4 = !s4;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s4,
                  selectedColor: Colors.greenAccent,
                ),
                FilterChip(
                  label: Text('Vegetarian'),
                  onSelected: (bool value) {
                    kind.add("Vegetarian");
                    setState(() {
                      s5 = !s5;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s5,
                  selectedColor: Colors.greenAccent,
                ),
                FilterChip(
                  label: Text('Others'),
                  onSelected: (bool value) {
                    kind.add("Others");
                    setState(() {
                      s6 = !s6;
                      if (Navigator.canPop(context)) {
                        _onAlertWithCustomContentPressed(context);
                      }
                    });
                  },
                  selected: s6,
                  selectedColor: Colors.greenAccent,
                ),
              ],
            ),
            TextFormField(
              controller: phoneNumber,
              validator: (String value) {
                if (is_alreadyused(phoneNumber.text, Restaurants.restaurants)) {
                  return 'this number was taken';
                }
                return null;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color:
                      phoneNumber.text.length != 11 ? Colors.red : Colors.grey,
                ),
                labelText: 'Phone Number',
                errorText: /*phoneNumber.text.length != 11 &&*/
                    is_alreadyused(phoneNumber.text, Restaurants.restaurants)
                        ? 'this number is not valid or it was taken'
                        : null,
                //regExp.hasMatch(phoneNumber.toString())?
              ),
            ),
            TextField(
              controller: pass,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: validatePassword(pass.text),
                  suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _toggle();
                          if (Navigator.canPop(context)) {
                            _onAlertWithCustomContentPressed(context);
                          }
                        });
                      }),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
        buttons: [
          DialogButton(
              gradient: LinearGradient(colors: [
                Color(0xff00FF00),
                Color.fromRGBO(0, 179, 134, 1.0),
              ]),
              child: Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                if (validatePassword(pass.text) == null &&
                    restaurantName != null &&
                    phoneNumber != null &&
                    pass != null &&
                    address != null &&
                    phoneNumber.text.length == 11 &&
                    !is_alreadyused(
                        phoneNumber.text, Restaurants.restaurants)) {
                  setState(() {
                    resKind = kind.toString();
                    send(restaurantName.text, resKind, phoneNumber.text,
                        pass.text, address.text);
                    Restaurants.add(Restaurant(restaurantName.text,
                        address.text, kind, phoneNumber.text, pass.text));
                    index = Restaurants.restaurants.length - 1;
                    restaurantName.clear();
                    phoneNumber.clear();
                    address.clear();
                    pass.clear();
                    kind.clear();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                } else {
                  if (Navigator.canPop(context)) {
                    _onAlertWithCustomContentPressed(context);
                  }
                }
              }),
          DialogButton(
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _onAlertWithCustomContentPressed2(context),
            gradient: LinearGradient(colors: [
              Colors.green[900],
              Colors.greenAccent[400],
            ]),
          ),
        ]).show();
  }

  _onAlertWithCustomContentPressed2(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextFormField(
              controller: phoneNumber,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  errorText: !is_alreadyused(
                          phoneNumber.text, Restaurants.getRestaurants())
                      ? 'this number not exist'
                      : null,
                  icon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  )),
              onSaved: (String value) {
                phone_number = int.parse(value);
              },
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: is_passCorrect(phoneNumber.text, pass.text,
                          Restaurants.getRestaurants())
                      ? null
                      : "incorrect",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _toggle();
                        if (Navigator.canPop(context)) {
                          _onAlertWithCustomContentPressed2(context);
                        }
                      });
                    },
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
              obscureText: _obscureText,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              print(is_passCorrect(phoneNumber.text, pass.text,
                      Restaurants.getRestaurants()) &&
                  phoneNumber.text != "");
              print(phoneNumber.text + " " + pass.text);
              if (is_passCorrect(phoneNumber.text, pass.text,
                      Restaurants.getRestaurants()) &&
                  phoneNumber.text != "") {
                for (Restaurant res in Restaurants.restaurants) {
                  if (res.phoneNumber.startsWith(phoneNumber.text)) {
                    index = Restaurants.restaurants.indexOf(res);
                    print(Restaurants.restaurants.elementAt(index).orders);
                  }
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home()),
                );
              } else {
                if (Navigator.canPop(context)) {
                  _onAlertWithCustomContentPressed2(context);
                }
              }
            },
            gradient: LinearGradient(colors: [
              Color(0xff00FF00),
              Color.fromRGBO(0, 179, 134, 1.0),
            ]),
          ),
          DialogButton(
            child: Text(
              "REGISTER",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _onAlertWithCustomContentPressed(context),
            gradient: LinearGradient(colors: [
              Colors.green[900],
              Colors.greenAccent[400],
            ]),
          )
        ]).show();
  }
}

void send(
    String name, String kind, String phone, String pass, String address) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected for register');

    String farman = "AddRestaurant-" +
        name +
        "-" +
        phone +
        "-" +
        pass +
        "-" +
        kind +
        "-" +
        address +
        "-" +
        " ";
    serverSocket.writeln(farman);
  });
}
