import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';

class ReviewProvider with ChangeNotifier {
  final RemoteRepository _repository;

  ReviewProvider(this._repository);

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

  void setRestaurantReviewData(List<CustomerReview>? data) {
    _restaurantReviewApiState =
        data != null ? OnDataLoaded(data) : OnFailure("No reviews");
  }

  void addNewReviews(Map<String, String> review) async {
    _setRestaurantReviewLoading();
    final restaurantReview = await _repository.addNewReview(review);
    _restaurantReviewApiState = restaurantReview;
    notifyListeners();
  }
}
