import 'package:equatable/equatable.dart';

class RestaurantDetail extends Equatable {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<Category>? categories;
  final Menus? menus;
  final List<CustomerReview>? reviews;

  const RestaurantDetail({
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

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pictureId,
        city,
        rating,
        categories,
        menus,
        reviews,
      ];
}

class Category extends Equatable {
  final String name;

  const Category({required this.name});

  @override
  List<Object?> get props => [name];
}

class Menu extends Equatable {
  final String name;
  const Menu({required this.name});

  @override
  List<Object?> get props => [name];
}

class Menus extends Equatable {
  final List<Menu>? foods;
  final List<Menu>? drinks;

  const Menus({
    required this.foods,
    required this.drinks,
  });

  @override
  List<Object?> get props => [foods, drinks];
}

class CustomerReview extends Equatable {
  final String name;
  final String review;
  final String date;

  const CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  List<Object?> get props => [name, review, date];
}
