import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';

class GetRestaurantById {
  final RestaurantRepository repository;
  GetRestaurantById(this.repository);

  Future<Restaurant?> execute(String id) {
    return repository.getRestaurantById(id);
  }
}
