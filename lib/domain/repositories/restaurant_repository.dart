import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/domain/entities/add_new_review.dart';
import 'package:restaurant_app/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<ApiState<List<Restaurant>>> getRestaurantsList();
  Future<ApiState<List<Restaurant>>> searchRestaurants(String query);
  Future<ApiState<RestaurantDetail>> getRestaurantDetail(String id);
  Future<ApiState<List<CustomerReview>>> addNewReview(AddNewReview review);
}
