import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_app/presentation/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/presentation/widgets/restaurant_list_item.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = "/restaurant_list";

  final RestaurantRepository repository;

  const RestaurantListPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: FutureBuilder<List<Restaurant>?>(
            future: repository.getRestaurants(),
            builder: (context, snapshot) {
              final List<Restaurant>? restaurants = snapshot.data;
              return restaurants != null && restaurants.isNotEmpty
                  ? _restaurantList(restaurants)
                  : _emptyList;
            },
          ),
        ),
      ),
    );
  }

  Widget _restaurantList(List<Restaurant> restaurants) => ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          Restaurant restaurant = restaurants[index];
          return _restaurantItem(restaurant, context);
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 0.5,
          color: Colors.grey[400],
        ),
      );

  Widget _restaurantItem(Restaurant restaurant, BuildContext context) =>
      RestaurantListItem(
        restaurant: restaurant,
        onTap: () {
          Navigator.pushNamed(
            context,
            RestaurantDetailPage.routeName,
            arguments: restaurant,
          );
        },
      );

  final Widget _emptyList = const Center(child: Text("Empty List"));
}
