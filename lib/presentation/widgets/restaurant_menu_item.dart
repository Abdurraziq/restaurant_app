import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/menu.dart';

class RestaurantMenuItem extends StatelessWidget {
  final Menu menu;
  final IconData icon;

  const RestaurantMenuItem({super.key, required this.menu, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 64,
        ),
        Text(
          menu.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
