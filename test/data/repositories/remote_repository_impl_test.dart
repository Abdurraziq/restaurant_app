import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

import '../../helpler_test/dummy_data/add_review.dart';
import '../../helpler_test/dummy_data/restaurant_detail.dart';
import '../../helpler_test/dummy_data/restaurant_list.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late RemoteRepositoryImpl repositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repositoryImpl = RemoteRepositoryImpl(
      dataSource: mockRemoteDataSource,
    );
  });

  group('get restaurant list', () {
    test(
      'should return OnDataLoaded with a list of Restaurant entity when '
      'data source return a valid data',
      () async {
        when(
          () => mockRemoteDataSource.getRestaurantsList(),
        ).thenAnswer(
          (_) async => restaurantListModelDummy,
        );

        final result = await repositoryImpl.getRestaurantsList();

        verify(() => mockRemoteDataSource.getRestaurantsList()).called(1);
        expect(result, equals(restaurantListEntityDummy));
      },
    );

    test(
      'should return OnFailure with a message when data source return exception',
      () async {
        when(
          () => mockRemoteDataSource.getRestaurantsList(),
        ).thenAnswer(
          (_) async => throw const EmptyDataException(),
        );

        final result = await repositoryImpl.getRestaurantsList();

        verify(() => mockRemoteDataSource.getRestaurantsList()).called(1);
        expect(result, equals(OnFailure<List<Restaurant>>("No data found")));
      },
    );
  });

  group('get restaurant detail', () {
    test(
      'should return OnDataLoaded with detail of Restaurant entity when '
      'data souce return a valid data',
      () async {
        when(
          () => mockRemoteDataSource.getRestaurantDetail("abc123"),
        ).thenAnswer(
          (_) async => restaurantDetailModelDummy,
        );

        final result = await repositoryImpl.getRestaurantDetail("abc123");

        verify(() => mockRemoteDataSource.getRestaurantDetail("abc123"))
            .called(1);
        expect(result, equals(restaurantDetailEntityDummy));
      },
    );

    test(
      'should return OnFailure with a message when data source return exception',
      () async {
        when(
          () => mockRemoteDataSource.getRestaurantDetail("abc123"),
        ).thenAnswer(
          (_) async => throw const EmptyDataException(),
        );

        final result = await repositoryImpl.getRestaurantDetail("abc123");

        verify(() => mockRemoteDataSource.getRestaurantDetail("abc123"))
            .called(1);
        expect(result, equals(OnFailure<RestaurantDetail>("No data found")));
      },
    );
  });

  group('search restaurant restaurant', () {
    test(
      'should return OnDataLoaded with list of Restaurant entity when '
      'data souce return a valid data',
      () async {
        when(
          () => mockRemoteDataSource.searchRestaurant("abc123"),
        ).thenAnswer(
          (_) async => restaurantListModelDummy,
        );

        final result = await repositoryImpl.searchRestaurants("abc123");

        verify(() => mockRemoteDataSource.searchRestaurant("abc123")).called(1);
        expect(result, equals(restaurantListEntityDummy));
      },
    );

    test(
      'should return OnFailure with a message when data source return exception',
      () async {
        when(
          () => mockRemoteDataSource.searchRestaurant("abc123"),
        ).thenAnswer(
          (_) async => throw const EmptyDataException(),
        );

        final result = await repositoryImpl.searchRestaurants("abc123");

        verify(() => mockRemoteDataSource.searchRestaurant("abc123")).called(1);
        expect(
          result,
          equals(OnFailure<List<Restaurant>>("No data found")),
        );
      },
    );
  });

  group('add review', () {
    final newReview = {
      'id': "Ahmad",
      'name': "Tidak rekomendasi untuk pelajar!",
      'review': "13 November 2019",
    };

    test(
      'should return OnDataLoaded with customer review entity when'
      'data souce return a valid data',
      () async {
        when(
          () => mockRemoteDataSource.addNewReview(newReview),
        ).thenAnswer(
          (_) async => customerReviewsModelDummy,
        );

        final result = await repositoryImpl.addNewReview(newReview);

        verify(() => mockRemoteDataSource.addNewReview(newReview)).called(1);
        expect(result, equals(customerReviewsEntityDummy));
      },
    );

    test(
      'should return OnFailure with a message when data source return exception',
      () async {
        when(
          () => mockRemoteDataSource.addNewReview(newReview),
        ).thenAnswer(
          (_) async => throw const EmptyDataException(),
        );

        final result = await repositoryImpl.addNewReview(newReview);

        verify(() => mockRemoteDataSource.addNewReview(newReview)).called(1);
        expect(
          result,
          equals(OnFailure<List<CustomerReview>>("No data found")),
        );
      },
    );
  });
}
