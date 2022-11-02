import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (_, value, __) {
        final apiState = value.restaurantListApiState;
        if (apiState is OnDataLoaded<List<Restaurant>>) {
          final List<Restaurant> restaurants = apiState.data;
          return _restaurantList(restaurants);
        } else if (apiState is OnFailure<List<Restaurant>>) {
          final message = apiState.message;
          return OnFailureWidget(
            message: message,
            withRefreshButton: false,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
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
