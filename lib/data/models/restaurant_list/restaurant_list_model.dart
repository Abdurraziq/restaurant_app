import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

import 'restaurant.dart';

part 'restaurant_list_model.g.dart';

@JsonSerializable()
class RestaurantListModel extends Equatable {
  final bool? error;
  final String? message;
  final int? count;
  final List<RestaurantItemModel>? restaurants;

  const RestaurantListModel({
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

  @override
  List<Object?> get props => [error, message, count, restaurants];
}
