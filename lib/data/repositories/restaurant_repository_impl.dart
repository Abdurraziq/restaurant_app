import 'package:restaurant_app/data/datasources/data_source.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final DataSource dataSource;

  RestaurantRepositoryImpl({required this.dataSource});

  @override
  Future<Restaurant?> getRestaurantById(String id) async {
    var result = await dataSource.getRestaurantById(id);
    return result?.toEntity();
  }

  @override
  Future<List<Restaurant>?> getRestaurants() async {
    var result = await dataSource.getRestaurants();
    return result.toEntity();
  }
}
