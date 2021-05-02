import 'package:snappfood_app/Restaurant.dart';

class Restaurants{
  static List<Restaurant> restaurants=List.empty(growable: true);
  static void add(Restaurant restaurant){
    restaurants.add(restaurant);
  }
  static List<Restaurant> getRestaurants(){
    return restaurants;
  }


}