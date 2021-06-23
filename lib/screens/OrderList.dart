class OrderDetails {
  String item;
  DateTime date;
  int code;
  double price;
  String name;
  bool sent = false;

  OrderDetails(String item, double price, DateTime date, int code, String name,
      bool sent) {
    this.item = item;
    this.date = date;
    this.code = code;
    this.price = price;
    this.name = name;
    this.sent = sent;
  }

  void isSent() {
    sent = !sent;
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
