class Endpoint {
  static const String apiBaseUrl = "restaurant-api.dicoding.dev";
  static const String listOfRestaurantPath = "list";
  static const String searchRestaurantPath = "search";
  static const String addReviewPath = "review";

  static String detailOfRestaurantPath(String id) => "detail/$id";

  static const String _imageBaseUrl =
      "https://restaurant-api.dicoding.dev/images";

  static Uri _getUrl({required String path, Map<String, dynamic>? query}) {
    return Uri(
      scheme: 'https',
      host: apiBaseUrl,
      path: path,
      queryParameters: query,
    );
  }

  static Uri restaurantList() {
    return _getUrl(path: listOfRestaurantPath);
  }

  static Uri restaurantDetail(String id) {
    return _getUrl(path: detailOfRestaurantPath(id));
  }

  static Uri searchRestaurant(String query) {
    return _getUrl(path: searchRestaurantPath, query: {"q": query});
  }

  static Uri addReview() {
    return _getUrl(path: addReviewPath);
  }

  static String smallPicture(String id) => "$_imageBaseUrl/small/$id";
  static String mediumPicture(String id) => "$_imageBaseUrl/medium/$id";
}
