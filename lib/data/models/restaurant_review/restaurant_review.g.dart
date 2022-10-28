// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantReview _$RestaurantReviewFromJson(Map<String, dynamic> json) =>
    RestaurantReview(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      customerReviews: (json['customerReviews'] as List<dynamic>?)
          ?.map((e) => CustomerReviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantReviewToJson(RestaurantReview instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'customerReviews': instance.customerReviews,
    };
