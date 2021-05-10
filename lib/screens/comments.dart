import 'package:flutter/material.dart';

class comment extends StatefulWidget {
  @override
  _commentState createState() => _commentState();
}

class _commentState extends State<comment> {
  TextEditingController answer;
  //String Answer;
  List<String> Answer = List.empty(growable: true);
  @override
  void initState() {
    answer = TextEditingController();
    super.initState();
  }

  void dispose() {
    answer.dispose();
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
        title: Text('Manage comments'),
      ),
      body: ListView(children: [
        GestureDetector(
          child: Card(
            child: ListTile(
              title: Text("COMMENT"),
              subtitle: Row(
                children: [
                  Text("Accept: "),
                  Switch(
                    value: Accept.accept,
                    onChanged: (value) {
                      setState(() {
                        Accept.convert();
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
                      "ANSWER",
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
                                            left: 15, right: 15, bottom: 30),
                                        child: TextField(
                                          controller: answer,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: ShowAnswer.getAnswer()),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: Text('SEND'),
                                        onPressed: () {
                                          setState(() {
                                            ShowAnswer.deleter();
                                            ShowAnswer.add(answer.text);
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
              tileColor: Color(0xfffffee0),
            ),
          ),
        )
      ]),
    );
  }
}
class Accept{
  static bool accept=false;
  static void convert(){
    accept=!accept;
  }
}
class ShowAnswer {
  static String ans = '';

  static void add(String text) {
    ans = ans  + text;
  }

  static String getAnswer() {
    return ans;
  }
  static String deleter(){
    ans='';
    return ans;
  }
}
