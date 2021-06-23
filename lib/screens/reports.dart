import 'package:flutter/material.dart';
import 'package:restaurant_app/modals/Restaurants.dart';
import 'package:restaurant_app/screens/OrderList.dart';
import 'package:restaurant_app/screens/loginScreen.dart';

class report extends StatefulWidget {
  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    MyStatefulWidget(),
    Mystatefull(),
    Text(
      'Index 1: Business',
    ),
  ];

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
        title: Text('Reports'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'sale statistics',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'orders list',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Sent {
  static int ind;
  static bool sent =
      Restaurants.getRestaurants().elementAt(index).orders.elementAt(ind).sent;

  static void convert() {
    sent = !sent;
    Restaurants.getRestaurants().elementAt(index).orders.elementAt(ind).sent =
        sent;
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
    Sent.ind = ind;
    ind++;
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
  final List<Item> _data = generateItems(1);

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
                Text("code: " +
                    Restaurants.getRestaurants()
                        .elementAt(index)
                        .orders
                        .elementAt(Sent.ind)
                        .code
                        .toString() +
                    "\n"),
                Text("Price: " +
                    Restaurants.getRestaurants()
                        .elementAt(index)
                        .orders
                        .elementAt(Sent.ind)
                        .price
                        .toString() +
                    " T\n"),
                Text(Restaurants.getRestaurants()
                    .elementAt(index)
                    .orders
                    .elementAt(Sent.ind)
                    .date
                    .toString()),
                Row(
                  children: [
                    Text("Sent"),
                    Switch(
                      value: Sent.sent,
                      onChanged: (value) {
                        setState(() {
                          Sent.convert();
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent[100],
                      activeColor: Colors.green,
                    ),
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

class Mystatefull extends StatefulWidget {
  @override
  _MystatefullState createState() => _MystatefullState();
}

class _MystatefullState extends State<Mystatefull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Card(
              child: MyStatelessWidget(),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Card(
              child: MyStatelessWidget2(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Report of',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Number',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Sum(T)',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Color(0xff7f1019),
      ),
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('To Day Sales')),
            DataCell(Text('4')),
            DataCell(Text('600000')),
          ],
        ),
      ],
    );
  }
}

class MyStatelessWidget2 extends StatelessWidget {
  const MyStatelessWidget2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Color(0xff7f1019),
      ),
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Report of',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Number',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Sum(T)',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Total Sales')),
            DataCell(Text('22')),
            DataCell(Text('22000000')),
          ],
        ),
      ],
    );
  }
}
