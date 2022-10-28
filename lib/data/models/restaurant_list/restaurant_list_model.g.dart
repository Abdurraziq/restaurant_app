// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantListModel _$RestaurantListModelFromJson(Map<String, dynamic> json) =>
    RestaurantListModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      count: json['count'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurantItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantListModelToJson(
        RestaurantListModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };
