import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

abstract class FavoriteRepository {
  Future setFavoriteRestaurant(RestaurantDetail restaurant);
  Future deleteFavoriteRestaurant(String id);
  Future<bool> isFavoriteRestaurant(String id);
  Future<ApiState<List<Restaurant>>> getFavoriteRestaurants();
}
