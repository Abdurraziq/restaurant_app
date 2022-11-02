import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ListProvider>().initRestaurant();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search Restaurant",
            ),
            onChanged: (text) {
              context.read<ListProvider>().getRestaurants(text);
            },
          ),
        ),
        Expanded(
          child: Consumer<ListProvider>(
            builder: (_, value, __) {
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
                    value.getRestaurants();
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
          Navigation.intentWithData(DetailPage.routeName, restaurant.id);
        },
      );
}
