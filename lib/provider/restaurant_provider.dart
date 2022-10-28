import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantProvider(this._repository) {
    _setRestaurantList();
  }

  final RestaurantRepository _repository;
  String _restaurantId = "";
  String _queryString = "";

  /// Restaurant List
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

    if (query != null && query.isNotEmpty) {
      _queryString = query;
      _searchRestaurants();
    } else if (query == null && _queryString.isNotEmpty) {
      _searchRestaurants();
    } else {
      _setRestaurantList();
    }
  }

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
    if (data is OnDataLoaded<RestaurantDetail>) {
      final reviews = data.data.reviews;
      _restaurantReviewApiState =
          reviews != null ? OnDataLoaded(reviews) : OnFailure("No reviews");
    }

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

  /// Review
  ApiState<List<CustomerReview>> _restaurantReviewApiState = OnLoading();
  ApiState<List<CustomerReview>> get restaurantReviewApiState =>
      _restaurantReviewApiState;

  void _setRestaurantReviewLoading() {
    if (_restaurantReviewApiState is! OnLoading<RestaurantDetail>) {
      _restaurantReviewApiState = OnLoading();
      notifyListeners();
    }
  }

  void addNewReviews(AddNewReview review) async {
    _setRestaurantReviewLoading();
    final restaurantReview = await _repository.addNewReview(review);
    _restaurantReviewApiState = restaurantReview;
    notifyListeners();
  }
}
