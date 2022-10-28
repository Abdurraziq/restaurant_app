// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantItemModel _$RestaurantItemModelFromJson(Map<String, dynamic> json) =>
    RestaurantItemModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      pictureId: json['pictureId'] as String?,
      city: json['city'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RestaurantItemModelToJson(
        RestaurantItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'rating': instance.rating,
    };
