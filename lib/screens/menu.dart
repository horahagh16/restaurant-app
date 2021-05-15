import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  TextEditingController description;
  TextEditingController price;
  TextEditingController Foodname;
  String prc = "60000";
  String name = "food";
  String desc = "vegetable,tomato,beef";

  @override
  void initState() {
    description = TextEditingController();
    price = TextEditingController();
    Foodname = TextEditingController();
    super.initState();
  }

  void dispose() {
    description.dispose();
    price.dispose();
    Foodname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  Color(0xff7f1019),
                  Color(0xffe62928),
                ])),
          ),
          title: Text('Edit Menu'),
        ),
        body: ListView(
          children: [
            GestureDetector(
              child: Card(
                child: ListTile(
                  leading: Column(
                    children: [CircleAvatar()],
                  ),
                  /*Image.asset(
                    'assets/images/back.png',
                    height: 100,
                    width: 100,
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.fill,
                  ),*/
                  tileColor: Color(0xfffffee0),
                  title: Column(
                    children: [
                      Text(name),
                      Text(prc),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text("Exist: "),
                      Switch(
                        value: Exist.exist,
                        onChanged: (value) {
                          setState(() {
                            Exist.convert();
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent[100],
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      RaisedButton(
                        child: Text(
                          "Show Detailes",
                          style: TextStyle(color: Colors.white),
                        ),
                        disabledColor: Color(0xff7f1019),
                        color: Color(0xff7f1019),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 30),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller: Foodname,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: null,
                                                    decoration: InputDecoration(
                                                        hintText: "name",
                                                        labelText: ShowDetails
                                                            .getter()),
                                                  ),
                                                  TextField(
                                                    controller: description,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: null,
                                                    decoration: InputDecoration(
                                                        hintText: "description",
                                                        labelText: ShowDetails
                                                            .getter()),
                                                  ),
                                                  TextField(
                                                    controller: price,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: null,
                                                    decoration: InputDecoration(
                                                        hintText: "price",
                                                        labelText: ShowDetails
                                                            .getter()),
                                                  ),
                                                ],
                                              )),
                                          ElevatedButton(
                                            child: Text('Done'),
                                            onPressed: () {
                                              setState(() {
                                                ShowDetails.deleter();
                                                ShowDetails.add(
                                                    description.text);
                                                prc = price.text;
                                                name = Foodname.text;
                                                Navigator.pop(context);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Exist {
  static bool exist = true;

  static void convert() {
    exist = !exist;
  }
}

class ShowDetails {
  static String name = 'food';
  static String det = 'beef,tomato';
  static String price = '20000';

  static void add(String text) {
    det = det + text;
  }

  static String getter() {
    return name;
  }

  static String getter2() {
    return det;
  }

  static String getter3() {
    return price;
  }

  static String deleter() {
    name = 'food';
    return name;
  }

  static String deleter2() {
    det = 'beef,tomato';
    return det;
  }

  static String deleter3() {
    price = '20000';
    return price;
  }
}
