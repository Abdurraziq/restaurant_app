import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/data/models/restaurants_response.dart';

abstract class DataSource {
  Future<RestaurantsResponse> getRestaurants();
  Future<RestaurantModel?> getRestaurantById(String id);
}
