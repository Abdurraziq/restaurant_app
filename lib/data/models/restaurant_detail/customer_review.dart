import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'customer_review.g.dart';

@JsonSerializable()
class CustomerReviewModel {
  String? name;
  String? review;
  String? date;

  CustomerReviewModel({this.name, this.review, this.date});

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) {
    return _$CustomerReviewModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerReviewModelToJson(this);

  CustomerReview toEntity() => CustomerReview(
        name: "$name",
        review: "$review",
        date: "$date",
      );
}
