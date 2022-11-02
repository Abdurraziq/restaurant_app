import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

import 'customer_review.dart';

part 'restaurant_review.g.dart';

@JsonSerializable()
class RestaurantReview extends Equatable {
  final bool? error;
  final String? message;
  final List<CustomerReviewItem>? customerReviews;

  const RestaurantReview({this.error, this.message, this.customerReviews});

  factory RestaurantReview.fromJson(Map<String, dynamic> json) {
    return _$RestaurantReviewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantReviewToJson(this);

  List<CustomerReview>? toEntity() =>
      customerReviews?.map((e) => e.toEntity()).toList();

  @override
  List<Object?> get props => [error, message, customerReviews];
}
