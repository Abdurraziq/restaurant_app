import 'package:json_annotation/json_annotation.dart';

import 'restaurant.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel {
  bool? error;
  String? message;
  RestaurantModel? restaurant;

  RestaurantDetailModel({this.error, this.message, this.restaurant});

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantDetailModelToJson(this);
}
