import 'package:restaurant_app/data/data.dart';

abstract class RemoteDataSource {
  Future<List<RestaurantItemModel>> getRestaurantsList();
  Future<RestaurantModel> getRestaurantDetail(String id);
  Future<List<RestaurantItemModel>> searchRestaurant(String query);
  Future<List<CustomerReviewItem>> addNewReview(Map<String, String> review);
}
