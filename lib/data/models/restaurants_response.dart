import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';

import 'restaurant_model.dart';

part 'restaurants_response.g.dart';

@JsonSerializable()
class RestaurantsResponse {
  final List<RestaurantModel>? restaurants;

  const RestaurantsResponse({this.restaurants});

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) {
    return _$RestaurantsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantsResponseToJson(this);

  List<Restaurant>? toEntity() =>
      restaurants?.map((e) => e.toEntity()).toList();
}
