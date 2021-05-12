import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/supportArea.dart';

class areas extends StatefulWidget {
  @override
  _areasState createState() => _areasState();
}

class _areasState extends State<areas> {
  TextEditingController area;
  List<String> address = List.empty(growable: true);

  @override
  void initState() {
    area = TextEditingController();
    super.initState();
  }

  void dispose() {
    area.dispose();
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
        title: Text('Support Areas'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(Area.getAreas()),
                  ),
                  TextField(
                    controller: area,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'areas'),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('  DONE  ',style: TextStyle(color: Colors.lightGreenAccent.shade400),),
                    onPressed: () {
                      setState(() {
                        Area.add(area.text);
                        area.clear();
                        //Navigator.pop(context);
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                    child: Text('DELETE',style: TextStyle(color: Colors.red.shade400),),
                    onPressed: () {
                      setState(() {
                        Area.deleter();
                        //Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
