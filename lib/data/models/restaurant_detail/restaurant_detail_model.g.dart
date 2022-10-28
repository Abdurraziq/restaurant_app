// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDetailModel _$RestaurantDetailModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantDetailModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantDetailModelToJson(
        RestaurantDetailModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurant': instance.restaurant,
    };
