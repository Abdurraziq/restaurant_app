import 'package:http/http.dart' as http;
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/utils/get_json.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<RestaurantModel> getRestaurantDetail(String id) async {
    final response = await client.get(Endpoint.restaurantDetail(id));
    final jsonMap = getJsonFromResponse(response);
    final restaurantDetail = RestaurantDetailModel.fromJson(jsonMap).restaurant;
    if (restaurantDetail != null) {
      return restaurantDetail;
    }
    throw const EmptyDataException("Restaurant is not found");
  }

  @override
  Future<List<RestaurantItemModel>> getRestaurantsList() async {
    final response = await client.get(Endpoint.restaurantList());
    final jsonMap = getJsonFromResponse(response);
    final restaurantList = RestaurantListModel.fromJson(jsonMap).restaurants;
    if (restaurantList != null && restaurantList.isNotEmpty) {
      return restaurantList;
    }
    throw const EmptyDataException("Restaurant data is empty");
  }

  @override
  Future<List<RestaurantItemModel>> searchRestaurant(String query) async {
    final response = await client.get(Endpoint.searchRestaurant(query));
    final jsonMap = getJsonFromResponse(response);
    final restaurantList = RestaurantListModel.fromJson(jsonMap).restaurants;
    if (restaurantList != null && restaurantList.isNotEmpty) {
      return restaurantList;
    }
    throw const EmptyDataException("Restaurant not found");
  }

  @override
  Future<List<CustomerReviewItem>> addNewReview(
      Map<String, String> review) async {
    final response = await client.post(Endpoint.addReview(), body: review);

    final jsonMap = getJsonFromResponse(response);
    final customerReviews = RestaurantReview.fromJson(jsonMap).customerReviews;
    if (customerReviews != null && customerReviews.isNotEmpty) {
      return customerReviews;
    }
    throw const EmptyDataException("Reviews not found");
  }
}
