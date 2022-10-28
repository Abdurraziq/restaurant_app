class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<Category>? categories;
  final Menus? menus;
  final List<CustomerReview>? reviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.categories,
    this.menus,
    this.reviews,
  });
}

class Category {
  final String name;

  Category({required this.name});
}

class Menu {
  final String name;
  Menu({required this.name});
}

class Menus {
  final List<Menu>? foods;
  final List<Menu>? drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });
}
