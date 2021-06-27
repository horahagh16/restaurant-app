import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/modals/resMenu.dart';
import 'package:restaurant_app/screens/areas.dart';
import 'package:restaurant_app/screens/loginScreen.dart';
import 'package:restaurant_app/screens/reports.dart';
import 'comments.dart';
import 'orders.dart';

class mainPanel extends StatefulWidget {
  @override
  _mainPanelState createState() => _mainPanelState();
}

class _mainPanelState extends State<mainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                      Color(0xffe62928),
                      Color(0xff7f1019),
                    ])),
                child: Center(
                    child: Text(
                  Restaurants.restaurants.elementAt(index).name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Exit'),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {},
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1 / 1),
                crossAxisSpacing: 22,
                mainAxisSpacing: 22,
                shrinkWrap: true,
                primary: true,
                padding: EdgeInsets.all(22.0),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          InkResponse(
                            child: Image.asset(
                              'assets/images/orders-0.png',
                              height: 110,
                              width: 110,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.fitWidth,
                            ),
                            onTap: () {
                              print(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orders()));
                            },
                          ),
                          Center(
                            child: const Text("\nOrders",
                                style: TextStyle(color: Color(0xff7f1019))),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfff5f5f5),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          InkResponse(
                            child: Image.asset(
                              'assets/images/editmenu.png',
                              height: 110,
                              width: 110,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuEdit()));
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nEdit Menu",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfff5f5f5),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          InkResponse(
                            child: Image.asset(
                              'assets/images/comments.png',
                              height: 100,
                              width: 100,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              print(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => comment()));
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nManage Comments",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //color: Color(0xfffffee0),
                    color: Color(0xfff5f5f5),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          InkResponse(
                            child: Image.asset(
                              'assets/images/report.png',
                              height: 110,
                              width: 110,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              print(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => report()));
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nReports",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfff5f5f5),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          InkResponse(
                            child: Image.asset(
                              'assets/images/area.png',
                              height: 110,
                              width: 110,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              print(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Areas()));
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nSupport Areas",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfff5f5f5),
                  ),
                ].toList(),
              ),
            );
          },
        ));
  }
}
