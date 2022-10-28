import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = "/restaurant_list";

  const RestaurantListPage({super.key});

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Consumer<RestaurantProvider>(
                  builder: (context, provider, _) => TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Search Restaurant"),
                    onChanged: (text) {
                      provider.setRestaurants(text);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Consumer<RestaurantProvider>(
                  builder: (context, value, child) {
                    final apiState = value.restaurantListApiState;
                    if (apiState is OnDataLoaded<List<Restaurant>>) {
                      final List<Restaurant> restaurants = apiState.data;
                      return _restaurantList(restaurants);
                    } else if (apiState is OnFailure<List<Restaurant>>) {
                      final message = apiState.message;
                      return OnFailureWidget(
                        message: message,
                        withRefreshButton: message != "Restaurant not found",
                        onTap: () {
                          value.setRestaurants();
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
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
          context
              .read<RestaurantProvider>()
              .setRestaurantDetailData(restaurant.id);
          Navigator.pushNamed(
            context,
            RestaurantDetailPage.routeName,
          );
        },
      );
}
