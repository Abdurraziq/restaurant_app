import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

abstract class DataSource {
  Future<List<RestaurantItemModel>> getRestaurantsList();
  Future<RestaurantModel> getRestaurantDetail(String id);
  Future<List<RestaurantItemModel>> searchRestaurant(String query);
  Future<List<CustomerReviewItem>> addNewReview(AddNewReview review);
}
