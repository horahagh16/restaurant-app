import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/screens/OrderList.dart';

import 'loginScreen.dart';

int count;

class orders extends StatefulWidget {
  @override
  _ordersState createState() => _ordersState();
}

class _ordersState extends State<orders> {
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
        title: Text('Orders'),
      ),
      body: ListView.builder(
          itemCount:
          Restaurants.getRestaurants().elementAt(index).orders.length,
          itemBuilder: (context, int ind) {
            return GestureDetector(child: MyStatefulWidget());
          }),
    ); //
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int ind) {
    return Item(
      headerValue: Restaurants.getRestaurants()
          .elementAt(index)
          .orders
          .elementAt(ind)
          .name,
      expandedValue: Restaurants.getRestaurants()
          .elementAt(index)
          .orders
          .elementAt(ind)
          .item,
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(
      Restaurants.getRestaurants().elementAt(index).orders.length);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: buildPanel(),
      ),
    );
  }

  Widget buildPanel() {
    return ExpansionPanelList(
      dividerColor: Color(0xff7f1019),
      expandedHeaderPadding: EdgeInsets.all(3),
      expansionCallback: (int ind, bool isExpanded) {
        setState(() {
          count=ind;
          _data[ind].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Color(0xfffffdaf),
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Column(
              children: [
                Text('\n'),
                Row(
                  children: [
                    Text("Preparing"),
                    Switch(
                      value: Restaurants.getRestaurants()
                          .elementAt(index)
                          .orders
                          .elementAt(count)
                          .sent,
                      onChanged: (value) {
                        setState(() {
                          Restaurants.getRestaurants()
                              .elementAt(index)
                              .orders
                              .elementAt(count)
                              .isSent();
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent[100],
                      activeColor: Colors.green,
                    ),
                    Text("Sent"),
                  ],
                ),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
