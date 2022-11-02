import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class RestaurantItemModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? pictureId;
  final String? city;
  final double? rating;

  const RestaurantItemModel({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  factory RestaurantItemModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantItemModelToJson(this);

  factory RestaurantItemModel.fromDetailEntity(RestaurantDetail restaurant) {
    return RestaurantItemModel(
      id: restaurant.id,
      name: restaurant.name,
      description: restaurant.description,
      pictureId: restaurant.pictureId,
      city: restaurant.city,
      rating: restaurant.rating,
    );
  }

  factory RestaurantItemModel.fromEntity(Restaurant restaurant) {
    return RestaurantItemModel(
      id: restaurant.id,
      name: restaurant.name,
      description: restaurant.description,
      pictureId: restaurant.pictureId,
      city: restaurant.city,
      rating: restaurant.rating,
    );
  }

  Restaurant toEntity() => Restaurant(
        id: "$id",
        name: "$name",
        description: "$description",
        pictureId: "$pictureId",
        city: "$city",
        rating: rating ?? 0,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pictureId,
        city,
        rating,
      ];
}
