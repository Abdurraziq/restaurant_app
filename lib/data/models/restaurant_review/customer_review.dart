import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'customer_review.g.dart';

@JsonSerializable()
class CustomerReviewItem {
  String? name;
  String? review;
  String? date;

  CustomerReviewItem({this.name, this.review, this.date});

  factory CustomerReviewItem.fromJson(Map<String, dynamic> json) {
    return _$CustomerReviewItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerReviewItemToJson(this);

  CustomerReview toEntity() => CustomerReview(
        name: "$name",
        review: "$review",
        date: "$date",
      );
}
