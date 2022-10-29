import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

class DetailProvider with ChangeNotifier {
  final RestaurantRepository _repository;

  DetailProvider(
    this._repository,
  );

  String _restaurantId = "";

  /// Restaurant Detail
  ApiState<RestaurantDetail> _restaurantDetailApiState = OnLoading();
  ApiState<RestaurantDetail> get restaurantDetailApiState =>
      _restaurantDetailApiState;

  void _setRestaurantDetailLoading() {
    if (_restaurantDetailApiState is! OnLoading<RestaurantDetail>) {
      _restaurantDetailApiState = OnLoading();
      notifyListeners();
    }
  }

  void _setRestaurantDetailData(ApiState<RestaurantDetail> data) {
    _restaurantDetailApiState = data;
    notifyListeners();
  }

  void refreshDetailData() async {
    _setRestaurantDetailLoading();
    final restaurant = await _repository.getRestaurantDetail(_restaurantId);
    _setRestaurantDetailData(restaurant);
  }

  void setRestaurantDetailData(String id) {
    _restaurantId = id;
    refreshDetailData();
  }
}
