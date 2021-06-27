import 'package:restaurant_app/modals/comment.dart';
import 'package:restaurant_app/modals/resMenu.dart';
import 'package:restaurant_app/screens/OrderList.dart';
import 'Food.dart';
import 'package:restaurant_app/modals/supportArea.dart';

class Restaurant {
  String name;
  String address;
  List kind = List.empty(growable: true);
  String phoneNumber;
  String password;
  List<Comment> comment = [Comment("thanks"), Comment("hi")];
  List<OrderDetails> orders = List.empty(growable: true);

  /*[
    OrderDetails("salad", 40000, DateTime.now(), 1234, "name1", false),
    OrderDetails("salad", 40000, DateTime.now(), 1237, "name5", false),
    OrderDetails("sandwich", 70000, DateTime.now(), 1222, "name2", false)
  ];*/
  List<Food> menu = [Food("food", "beef", 20000, "all")];

  // List.empty(growable: true);

  double star = 0;
  int sta = 0;
  int count = 0;
  String supportArea;

  static int all;
  static int today;

  int sold_number = 0;
  double sold_sum = 0;

  Restaurant(String name, String address, List kind, String phone_number,
      String password) {
    this.name = name;
    this.address = address;
    this.kind = kind;
    this.phoneNumber = phone_number;
    this.password = password;
  }

  List<String> foodNames() {
    List<String> names = ['Foods'];
    for (Food f in menu) {
      names.add(f.name);
    }
    return names;
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
    return phoneNumber;
  }

  String getPassword() {
    return password;
  }

  Comment getComment(int index) {
    return comment.elementAt(index);
  }

  String getArea() {
    return Area.getAreas();
  }

  void setArea() {
    this.supportArea = Area.getAreas();
  }

  void stars(int star) {
    count++;
    sta += star;
    this.star = sta / count;
  }

  void increase_SoldAmount(double price1) {
    this.sold_sum += price1;
  }

  void increase_SoldNumber() {
    this.sold_number += 1;
  }

  double getSoldAmount() {
    return sold_sum;
  }

  int getSoldNumber() {
    return sold_number;
  }
}
