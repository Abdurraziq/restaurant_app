import 'package:restaurant_app/data/data.dart';

abstract class FavoriteDataSource {
  Future setFavoriteRestaurant(RestaurantItemModel restaurant);
  Future deleteFavoriteRestaurant(String id);
  Future<List<RestaurantItemModel>> getFavoriteRestaurants();
  Future<bool> isFavoriteRestaurant(String id);
}
