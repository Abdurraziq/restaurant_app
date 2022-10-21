import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';

import 'menus_model.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel {
  final String? id;
  final String? name;
  final String? description;
  final String? pictureId;
  final String? city;
  final double? rating;
  final MenusModel? menus;

  const RestaurantModel({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  Restaurant toEntity() => Restaurant(
        id: id ?? "",
        name: name ?? "-",
        description: description ?? "",
        pictureId: pictureId ?? "",
        city: city ?? "",
        rating: rating ?? 0.0,
        menus: menus?.toEntity(),
      );
}
