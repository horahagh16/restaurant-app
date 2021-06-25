import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/modals/Restaurant.dart';
import 'package:restaurant_app/screens/loginScreen.dart';
import 'package:restaurant_app/modals/Food.dart';

List<String> allNames = Restaurants.restaurants.elementAt(index).foodNames();

class MenuEdit extends StatefulWidget {
  @override
  _MenuEditState createState() => _MenuEditState();
}

class _MenuEditState extends State<MenuEdit> {
  TextEditingController description;
  TextEditingController price;
  TextEditingController Foodname;
  TextEditingController category;
  TextEditingController temp1, temp2, temp3, temp4;

  @override
  void initState() {
    description = TextEditingController();
    price = TextEditingController();
    Foodname = TextEditingController();
    temp1 = TextEditingController();
    temp2 = TextEditingController();
    temp3 = TextEditingController();
    temp4 = TextEditingController();
    super.initState();
  }

  void dispose() {
    description.dispose();
    price.dispose();
    Foodname.dispose();
    temp1.dispose();
    temp2.dispose();
    temp3.dispose();
    temp4.dispose();
    super.dispose();
  }

  void _editFood(context, int index1) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(5),
              child: SingleChildScrollView(
                  child: Container(
                      child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                  child: Column(
                    children: [
                      TextField(
                        controller: Foodname,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "name",
                        ),
                      ),
                      TextField(
                        controller: description,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "description",
                        ),
                      ),
                      TextField(
                        controller: price,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "price",
                        ),
                      ),
                      TextField(
                        controller: category,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "category",
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Color(0xff7f1019),
                          ),
                          onPressed: () {
                            //items.removeAt(this);
                            Restaurants.getRestaurants()
                                .elementAt(index)
                                .menu
                                .removeAt(index1);
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
                            Restaurants.getRestaurants()
                                .elementAt(index)
                                .menu
                                .elementAt(index1)
                                .name = Foodname.text;
                            Restaurants.getRestaurants()
                                .elementAt(index)
                                .menu
                                .elementAt(index1)
                                .category = category.text;
                            Restaurants.getRestaurants()
                                .elementAt(index)
                                .menu
                                .elementAt(index1)
                                .details = description.text;
                            Restaurants.getRestaurants()
                                .elementAt(index)
                                .menu
                                .elementAt(index1)
                                .price = double.tryParse(price.text);
                            Navigator.pop(context);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ]))));
        });
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
            child: Column(children: [
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
                      label: Text('mani course'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('conflicts'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              ),
              Container(
                  child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: List.generate(
                    Restaurants.getRestaurants().elementAt(index).menu.length,
                    (ind) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff7f1019),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: GestureDetector(
                        child: Row(
                          children: [
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
                            Column(
                              children: [
                                Text(
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .menu
                                      .elementAt(ind)
                                      .name,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  Restaurants.getRestaurants()
                                          .elementAt(index)
                                          .menu
                                          .elementAt(ind)
                                          .details +
                                      "\n" +
                                      Restaurants.getRestaurants()
                                          .elementAt(index)
                                          .menu
                                          .elementAt(ind)
                                          .price
                                          .toString() +
                                      " T ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                                Row(
                                  children: [
                                    Text("Exist:  "),
                                    Switch(
                                      value: Restaurants.getRestaurants()
                                          .elementAt(index)
                                          .menu
                                          .elementAt(ind)
                                          .exist,
                                      onChanged: (value) {
                                        setState(() {
                                          Restaurants.getRestaurants()
                                              .elementAt(index)
                                              .menu
                                              .elementAt(ind)
                                              .isExist();
                                        });
                                      },
                                      activeTrackColor:
                                          Colors.lightGreenAccent[100],
                                      activeColor: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                RaisedButton(
                                  child: Text(
                                    "Show Detailes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  disabledColor: Color(0xff7f1019),
                                  color: Color(0xff7f1019),
                                  onPressed: () {
                                    _editFood(context, ind);
                                  },
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color(0xff7f1019),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Restaurants.getRestaurants()
                                            .elementAt(index)
                                            .menu
                                            .remove(Restaurants.getRestaurants()
                                                .elementAt(index)
                                                .menu
                                                .elementAt(ind));
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xff7f1019),
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
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 20),
                              child: TextField(
                                controller: temp3,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    hintText: "20000", labelText: "Price"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 20),
                              child: TextField(
                                controller: temp4,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    hintText: "Main course or Conflicts",
                                    labelText: "category"),
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
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .menu
                                      .add(Food(
                                          temp1.text,
                                          temp2.text,
                                          double.parse(temp3.text),
                                          temp4.text));
                                  temp4.clear();
                                  temp1.clear();
                                  temp2.clear();
                                  temp3.clear();
                                  Navigator.pop(context);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ));
              });
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  var suggestion = Restaurants.restaurants.elementAt(index).foodNames();
  List<String> searchResult = [];

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
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(suggestion.length, (index) {
            var item = suggestion[index];
            return Card(
              color: Colors.white,
              child: Container(padding: EdgeInsets.all(16), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Color(0xff727272)),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
