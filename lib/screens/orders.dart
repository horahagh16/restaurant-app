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
      body: MyStatefulWidget(),
    ); //
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int ind) {
    return Item(
      headerValue: Restaurants.getRestaurants()
          .elementAt(index)
          .orders
          .elementAt(ind)
          .getName(),
      expandedValue: Restaurants.getRestaurants()
          .elementAt(index)
          .orders
          .elementAt(ind)
          .getItem(),
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(
      Restaurants.getRestaurants().elementAt(index).orders.length);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int ind, bool isExpanded) {
        setState(() {
          _data[ind].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
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
                          .elementAt(_data.indexOf(item))
                          .sent,
                      onChanged: (value) {
                        setState(() {
                          Restaurants.getRestaurants()
                              .elementAt(index)
                              .orders
                              .elementAt(_data.indexOf(item))
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

            /*const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }*/
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
