import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class RestaurantItemModel {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantItemModel({
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

  Restaurant toEntity() => Restaurant(
        id: "$id",
        name: "$name",
        description: "$description",
        pictureId: "$pictureId",
        city: "$city",
        rating: rating ?? 0,
      );
}
