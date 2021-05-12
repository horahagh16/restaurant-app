class OrderDetails {
  String item;
  DateTime date;
  int code;
  double price;
  String name;
  bool sent = false;

  OrderDetails() {
    item = 'Pizza, Soda, Salad';
    date = DateTime.now();
    code = 992430;
    price = 122000;
    name = "miss Smith";
  }

  void setSent(bool issent) {
    sent = issent;
  }

  String getItem() {
    return item;
  }

  DateTime getDate() {
    return date;
  }

  String getName() {
    return name;
  }

  int getCode() {
    return code;
  }

  double getPrice() {
    return price;
  }
}
