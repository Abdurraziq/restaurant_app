import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/domain.dart';

class ReviewItem extends StatelessWidget {
  final CustomerReview review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      title: Text(review.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4.0),
          Text(review.review),
        ],
      ),
      leading: const Icon(Icons.account_circle),
      isThreeLine: true,
    );
  }
}
