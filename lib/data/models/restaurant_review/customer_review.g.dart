// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReviewItem _$CustomerReviewItemFromJson(Map<String, dynamic> json) =>
    CustomerReviewItem(
      name: json['name'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CustomerReviewItemToJson(CustomerReviewItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };
