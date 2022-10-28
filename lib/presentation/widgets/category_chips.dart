import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/domain.dart';

class CategoryChips extends StatelessWidget {
  final List<Category> categories;
  const CategoryChips({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: categories
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: Text(
                  e.name,
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
