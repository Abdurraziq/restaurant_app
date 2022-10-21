import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/datasources/data_source.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/data/models/restaurants_response.dart';

const String jsonPath = "assets/data/local_restaurant.json";

class DataSourceImpl implements DataSource {
  final BuildContext context;

  DataSourceImpl({required this.context});

  Future<RestaurantsResponse> _getRestaurantData() async {
    final String data =
        await DefaultAssetBundle.of(context).loadString(jsonPath);

    final Map<String, dynamic> json = jsonDecode(data);
    return RestaurantsResponse.fromJson(json);
  }

  @override
  Future<RestaurantModel?> getRestaurantById(String id) async {
    final RestaurantsResponse restaurants = await _getRestaurantData();
    final RestaurantModel? restaurant = restaurants.restaurants
        ?.where((element) => element.id == id)
        .firstOrNull;
    return restaurant;
  }

  @override
  Future<RestaurantsResponse> getRestaurants() async {
    return await _getRestaurantData();
  }
}
