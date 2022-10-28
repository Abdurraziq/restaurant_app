import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'review_item.dart';

class ReviewList extends StatelessWidget {
  final List<CustomerReview> reviews;
  const ReviewList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewItem(review: reviews[index]);
      },
      separatorBuilder: (context, index) => Divider(
        thickness: 0.5,
        color: Colors.grey[400],
      ),
    );
  }
}
