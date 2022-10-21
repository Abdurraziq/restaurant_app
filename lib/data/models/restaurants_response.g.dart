// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantsResponse _$RestaurantsResponseFromJson(Map<String, dynamic> json) =>
    RestaurantsResponse(
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantsResponseToJson(
        RestaurantsResponse instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };
