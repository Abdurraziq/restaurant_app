class Endpoint {
  static const String _apiBaseUrl = "restaurant-api.dicoding.dev";
  static const String _listOfRestaurantPath = "list";
  static const String _searchRestaurantPath = "search";
  static const String _addReviewPath = "review";

  static String _detailOfRestaurantPath(String id) => "detail/$id";

  static const String _imageBaseUrl =
      "https://restaurant-api.dicoding.dev/images";

  static Uri _getUrl({required String path, Map<String, dynamic>? query}) {
    return Uri(
      scheme: 'https',
      host: _apiBaseUrl,
      path: path,
      queryParameters: query,
    );
  }

  static Uri restaurantList() {
    return _getUrl(path: _listOfRestaurantPath);
  }

  static Uri restaurantDetail(String id) {
    return _getUrl(path: _detailOfRestaurantPath(id));
  }

  static Uri searchRestaurant(String query) {
    return _getUrl(path: _searchRestaurantPath, query: {"q": query});
  }

  static Uri addReview() {
    return _getUrl(path: _addReviewPath);
  }

  static String smallPicture(String id) => "$_imageBaseUrl/small/$id";
  static String mediumPicture(String id) => "$_imageBaseUrl/medium/$id";
}
