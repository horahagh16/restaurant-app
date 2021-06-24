class Food {
  String name;
  String details;
  int price;
  String category;
  bool exist = true;

  void isExist() {
    exist = !exist;
  }
}
