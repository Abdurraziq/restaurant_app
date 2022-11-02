import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class RestaurantModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? city;
  final String? address;
  final String? pictureId;
  final double? rating;
  final List<CategoryModel>? categories;
  final MenusModel? menus;
  final List<CustomerReviewModel>? customerReviews;

  const RestaurantModel({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  RestaurantDetail toEntity() => RestaurantDetail(
        id: "$id",
        name: "$name",
        description: "$description",
        pictureId: "$pictureId",
        city: "$city",
        rating: rating ?? 0,
        categories: categories?.map((e) => e.toEntity()).toList(),
        menus: menus?.toEntity(),
        reviews: customerReviews?.reversed.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        rating,
        categories,
        menus,
        customerReviews,
      ];
}
