import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDataSource favoriteDataSource;

  FavoriteRepositoryImpl({required this.favoriteDataSource});

  @override
  Future setFavoriteRestaurant(RestaurantDetail restaurantDetail) async {
    return await favoriteDataSource.setFavoriteRestaurant(
      RestaurantItemModel.fromDetailEntity(restaurantDetail),
    );
  }

  @override
  Future deleteFavoriteRestaurant(String id) async {
    return await favoriteDataSource.deleteFavoriteRestaurant(id);
  }

  @override
  Future<ApiState<List<Restaurant>>> getFavoriteRestaurants() async {
    try {
      final result = await favoriteDataSource.getFavoriteRestaurants();
      final restaurants = result.map((e) => e.toEntity()).toList();
      return OnDataLoaded(restaurants);
    } catch (e) {
      return OnFailure("No favorite restaurant...");
    }
  }

  @override
  Future<bool> isFavoriteRestaurant(String id) async {
    return await favoriteDataSource.isFavoriteRestaurant(id);
  }
}
