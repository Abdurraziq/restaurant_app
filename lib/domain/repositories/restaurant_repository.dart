import 'package:restaurant_app/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>?> getRestaurants();
  Future<Restaurant?> getRestaurantById(String id);
}
