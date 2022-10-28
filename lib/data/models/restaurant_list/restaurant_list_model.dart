import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

import 'restaurant.dart';

part 'restaurant_list_model.g.dart';

@JsonSerializable()
class RestaurantListModel {
  bool? error;
  String? message;
  int? count;
  List<RestaurantItemModel>? restaurants;

  RestaurantListModel({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantListModelToJson(this);

  List<Restaurant>? toEntity() =>
      restaurants?.map((e) => e.toEntity()).toList();
}
