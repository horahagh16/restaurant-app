import 'FoodCategory.dart';

class Restaurant {
  String name;
  String address;
  List kind;
  String phone_number;
  String password;

  Restaurant(String name, String address, List kind, String phone_number,
      String password) {
    this.name = name;
    this.address;
    this.kind = kind;
    this.phone_number = phone_number;
    this.password = password;
  }

  String getName() {
    return name;
  }

  String getAddress() {
    return address;
  }

  List getKind() {
    return kind;
  }

  String getPhoneNumber() {
    return phone_number;
  }

  String getPassword() {
    return password;
  }
}
