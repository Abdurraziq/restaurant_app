import 'dart:io';

import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final RemoteDataSource dataSource;
  RemoteRepositoryImpl({required this.dataSource});

  Future<ApiState<T>> _returnValue<T>(Future<T> Function() F) async {
    try {
      return OnDataLoaded(await F());
    } on FetchDataErrorException catch (e) {
      return OnFailure(e.message);
    } on EmptyDataException catch (e) {
      return OnFailure(e.message);
    } on SocketException {
      return OnFailure("Connection failure");
    } catch (e) {
      return OnFailure("Unknown failure");
    }
  }

  @override
  Future<ApiState<RestaurantDetail>> getRestaurantDetail(String id) async {
    return _returnValue<RestaurantDetail>(() async {
      final data = await dataSource.getRestaurantDetail(id);
      return data.toEntity();
    });
  }

  @override
  Future<ApiState<List<Restaurant>>> getRestaurantsList() async {
    return _returnValue<List<Restaurant>>(() async {
      final data = await dataSource.getRestaurantsList();
      return data.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<ApiState<List<Restaurant>>> searchRestaurants(String query) async {
    return _returnValue<List<Restaurant>>(() async {
      final data = await dataSource.searchRestaurant(query);
      return data.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<ApiState<List<CustomerReview>>> addNewReview(
      Map<String, String> review) async {
    return _returnValue<List<CustomerReview>>(() async {
      final data = await dataSource.addNewReview(review);
      return data.reversed.map((e) => e.toEntity()).toList();
    });
  }
}
