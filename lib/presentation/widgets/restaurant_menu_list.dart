import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/menu.dart';
import 'package:restaurant_app/presentation/widgets/restaurant_menu_item.dart';

class RestaurantMenuList extends StatelessWidget {
  final List<Menu>? menus;
  final IconData icon;

  const RestaurantMenuList({
    super.key,
    required this.menus,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final List<Menu>? menus = this.menus;
    final ScrollController scrollController = ScrollController();

    if (menus != null && menus.isNotEmpty) {
      return SizedBox(
        height: 120.0,
        child: Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10.0),
            itemCount: menus.length,
            itemBuilder: (context, index) {
              final Menu menu = menus[index];
              return SizedBox(
                width: 120.0,
                child: RestaurantMenuItem(
                  menu: menu,
                  icon: icon,
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 32.0),
        child: Text(
          "Unavailable 😞",
          style: Theme.of(context).textTheme.caption,
        ),
      );
    }
  }
}
