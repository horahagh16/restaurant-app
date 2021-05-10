import 'FoodCategory.dart';

class Restaurant {
  String name;
  String address;
  List kind;
  String phone_number;
  String password;
  List<String> comment=List.empty(growable: true);

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
  String getcomment(int index){
    return comment.elementAt(index);
  }
}
