import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'mainPanel.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
        title: Text('Snapp food'),
      ),
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
      body: mainPanel(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_circle),
        backgroundColor: Color(0xff7f1019),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PopupDialog()),
          );
        },
      ),
    );
  }
}
