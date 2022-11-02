import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/domain/domain.dart';

class FavoriteProvider with ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteProvider(this._repository) {
    setFavoriteRestaurantList();
  }

  bool _isFavoriteRestaurant = false;
  bool get isFavoriteRestaurant => _isFavoriteRestaurant;

  ApiState<List<Restaurant>> _restaurantListApiState = OnLoading();
  ApiState<List<Restaurant>> get restaurantListApiState =>
      _restaurantListApiState;

  void _setRestaurantListData(ApiState<List<Restaurant>> data) {
    _restaurantListApiState = data;
    notifyListeners();
  }

  void setFavoriteRestaurantList() async {
    final restaurants = await _repository.getFavoriteRestaurants();
    _setRestaurantListData(restaurants);
  }

  void deleteFavoriteRestaurant(String id) async {
    await _repository.deleteFavoriteRestaurant(id);
    _isFavoriteRestaurant = false;
    setFavoriteRestaurantList();
  }

  void addRestaurantToFavorite(RestaurantDetail restaurant) async {
    await _repository.setFavoriteRestaurant(restaurant);
    _isFavoriteRestaurant = true;
    setFavoriteRestaurantList();
  }

  void checkIsFavorited(String id) async {
    _isFavoriteRestaurant = await _repository.isFavoriteRestaurant(id);
    notifyListeners();
  }
}
