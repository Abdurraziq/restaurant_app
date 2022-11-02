import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

class DetailProvider with ChangeNotifier {
  final RemoteRepository _repository;

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
    }
  }

  void _setRestaurantDetailData() async {
    final restaurant = await _repository.getRestaurantDetail(_restaurantId);
    _restaurantDetailApiState = restaurant;
    notifyListeners();
  }

  void refreshDetailData() async {
    _setRestaurantDetailLoading();
    notifyListeners();
    _setRestaurantDetailData();
  }

  void getRestaurantDetailData(String id) async {
    _restaurantId = id;
    _setRestaurantDetailLoading();
    _setRestaurantDetailData();
  }
}
