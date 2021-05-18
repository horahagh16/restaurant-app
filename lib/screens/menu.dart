import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  TextEditingController description;
  TextEditingController price;
  TextEditingController Foodname;
  TextEditingController category;
  var temp1, temp2, temp3;

  void _addFood(context) {
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
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: temp1,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: "name", labelText: "Food Name"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: temp2,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: "beef, tomato",
                              labelText: "Food Details"),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 20),
                        child: TextField(
                          controller: temp3,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: "20000", labelText: "Price"),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 20),
                        child: TextField(
                          controller: category,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: "soups", labelText: "category"),
                        ),
                      ),
                      RaisedButton(
                        color: Color(0xfffffdaf),
                        child: Text('Set picture'),
                        onPressed: () {
                          setState(() {
                            //
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(1)),
                      RaisedButton(
                        color: Colors.greenAccent[400],
                        child: Text(' Add '),
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  Future<List<Widget>> createList() async {
    List items = new List<Widget>();

    void add(item food) {
      items.add(food);
    }

    List getter() {
      return items;
    }

    items.add(Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, spreadRadius: 2.0, blurRadius: 5.0),
            ]),
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Image.asset(
                "assets/images/back.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(ShowDetails.name),
                    Text(
                      ShowDetails.det,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(ShowDetails.price + " T"),
                    Row(
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
                        Spacer(),
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
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: "name",
                                                              labelText:
                                                                  ShowDetails
                                                                      .getter()),
                                                    ),
                                                    TextField(
                                                      controller: description,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "description",
                                                          labelText: ShowDetails
                                                              .getter2()),
                                                    ),
                                                    TextField(
                                                      controller: price,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                          hintText: "price",
                                                          labelText: ShowDetails
                                                              .getter3()),
                                                    ),
                                                    TextField(
                                                      controller: category,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: "soups",
                                                              labelText:
                                                                  'category'),
                                                    ),
                                                  ],
                                                )),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Color(0xff7f1019),
                                                ),
                                                onPressed: () {
                                                  //items.removeAt(this);
                                                }),
                                            RaisedButton(
                                              color: Color(0xfffffdaf),
                                              child: Text('Change picture'),
                                              onPressed: () {
                                                setState(() {
                                                  //
                                                });
                                              },
                                            ),
                                            Padding(padding: EdgeInsets.all(1)),
                                            RaisedButton(
                                              color: Colors.greenAccent[400],
                                              child: Text('Done'),
                                              onPressed: () {
                                                setState(() {
                                                  ShowDetails.deleter();
                                                  ShowDetails.add(
                                                      Foodname.text,
                                                      description.text,
                                                      price.text);
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));

    return items;
  }

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
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      ActionChip(
                        label: Text('All'),
                        onPressed: () {},
                        shadowColor: Colors.greenAccent,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      ActionChip(
                        label: Text('pizza'),
                        onPressed: () {},
                        shadowColor: Colors.greenAccent,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      ActionChip(
                        label: Text('sandwich'),
                        onPressed: () {},
                        shadowColor: Colors.greenAccent,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      ActionChip(
                        label: Text('soup'),
                        onPressed: () {},
                        shadowColor: Colors.greenAccent,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
                FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: snapshot.data,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    })
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xff7f1019),
        onPressed: () {
          _addFood(context);
        },
      ),
    );
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
  static String det = 'beef,tomato,...';
  static String price = '20000';

  static void add(String text1, String text2, String text3) {
    name = text1;
    det = text2;
    price = text3;
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
    det = 'beef,tomato,...';
    return det;
  }

  static String deleter3() {
    price = '20000';
    return price;
  }
}

class item {
  String name;
  String det;
  String price;

  item(String name, String det, String price) {
    this.price = price;
    this.name = name;
    this.det = det;
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResult = List();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {},
      ),
    );
  }
}
