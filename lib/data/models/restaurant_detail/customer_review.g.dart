// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReviewModel _$CustomerReviewModelFromJson(Map<String, dynamic> json) =>
    CustomerReviewModel(
      name: json['name'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CustomerReviewModelToJson(
        CustomerReviewModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };
