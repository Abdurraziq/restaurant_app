import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/domain/domain.dart';

abstract class RemoteRepository {
  Future<ApiState<List<Restaurant>>> getRestaurantsList();
  Future<ApiState<List<Restaurant>>> searchRestaurants(String query);
  Future<ApiState<RestaurantDetail>> getRestaurantDetail(String id);
  Future<ApiState<List<CustomerReview>>> addNewReview(
      Map<String, String> review);
}
