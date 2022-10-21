import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';

class GetRestaurant {
  final RestaurantRepository repository;
  GetRestaurant(this.repository);

  Future<List<Restaurant>?> execute() {
    return repository.getRestaurants();
  }
}
