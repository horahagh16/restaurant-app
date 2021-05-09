import 'package:flutter/material.dart';
import 'loginScreen.dart';

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
            children: const <Widget>[
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
                  'RESTAURANT APP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Profile'),
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
                            },
                          ),
                          Center(
                            child: const Text("\nOrders",
                                style: TextStyle(color: Color(0xff7f1019))),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfffffdaf),
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
                              print(index);
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nEdit menu",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfffffee0),
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
                            },
                          ),
                          Column(
                            children: [
                              const Text("\nManage comments",
                                  style: TextStyle(color: Color(0xff7f1019))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xfffffee0),
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
                    color: Color(0xfffffdaf),
                  ),
                ].toList(),
              ),
            );
          },
        ));
  }
}