import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'restaurant.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends Equatable {
  final bool? error;
  final String? message;
  final RestaurantModel? restaurant;

  const RestaurantDetailModel({this.error, this.message, this.restaurant});

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantDetailModelToJson(this);

  @override
  List<Object?> get props => [error, message, restaurant];
}
