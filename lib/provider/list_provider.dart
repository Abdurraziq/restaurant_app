import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

class ListProvider with ChangeNotifier {
  final RestaurantRepository _repository;

  ListProvider(this._repository) {
    _setRestaurantList();
  }

  String _queryString = "";

  ApiState<List<Restaurant>> _restaurantListApiState = OnLoading();
  ApiState<List<Restaurant>> get restaurantListApiState =>
      _restaurantListApiState;

  void _setRestaurantListLoading() {
    if (_restaurantListApiState is! OnLoading<List<Restaurant>>) {
      _restaurantListApiState = OnLoading();
      notifyListeners();
    }
  }

  void _setRestaurantListData(ApiState<List<Restaurant>> data) {
    _restaurantListApiState = data;
    notifyListeners();
  }

  void _searchRestaurants() async {
    final restaurants = await _repository.searchRestaurants(_queryString);
    _setRestaurantListData(restaurants);
  }

  void _setRestaurantList() async {
    final restaurants = await _repository.getRestaurantsList();
    _setRestaurantListData(restaurants);
  }

  void setRestaurants([String? query]) async {
    _setRestaurantListLoading();
    _queryString = query ?? "";

    if (_queryString.isNotEmpty) {
      _searchRestaurants();
    } else {
      _setRestaurantList();
    }
  }
}
