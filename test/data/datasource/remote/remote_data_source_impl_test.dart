import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/data/data.dart';

import '../../../helpler_test/dummy_data/add_review.dart';
import '../../../helpler_test/dummy_data/restaurant_detail.dart';
import '../../../helpler_test/dummy_data/restaurant_list.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get restaurant list', () {
    final Uri endPoint = Endpoint.restaurantList();

    group('2xx-response code', () {
      test(
        'should return valid list of RestaurantItemModel when response is valid',
        () async {
          when(
            () => mockHttpClient.get(endPoint),
          ).thenAnswer(
            (_) async => http.Response(restaurantListResponseDummy, 200),
          );

          final result = await dataSource.getRestaurantsList();

          expect(result, equals(restaurantListModelDummy));
        },
      );

      test(
        'should throw EmptyDataException when body response is empty',
        () async {
          when(
            () => mockHttpClient.get(endPoint),
          ).thenAnswer(
            (_) async => http.Response("", 200),
          );

          expect(
            () async => await dataSource.getRestaurantsList(),
            throwsA(
              isA<EmptyDataException>().having(
                (exception) => exception.message,
                "Exception message",
                "No data found",
              ),
            ),
          );
        },
      );

      test(
        'should throw EmptyDataException when restasurant list response is empty',
        () async {
          when(
            () => mockHttpClient.get(endPoint),
          ).thenAnswer(
            (_) async => http.Response(emptyRestaurantListResponseDummy, 200),
          );

          expect(
            () => dataSource.getRestaurantsList(),
            throwsA(
              isA<EmptyDataException>().having(
                (exception) => exception.message,
                "Exception message",
                "Restaurant data is empty",
              ),
            ),
          );
        },
      );
    });

    test(
      'should return throw FetchDataErrorException when status code 400',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 400),
        );

        expect(
          () async => await dataSource.getRestaurantsList(),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Bad request",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 401',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 401),
        );

        expect(
          () async => await dataSource.getRestaurantsList(),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Unauthorized",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 404',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 404),
        );

        expect(
          () async => await dataSource.getRestaurantsList(),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Data not found",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 500',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 500),
        );

        expect(
          () async => await dataSource.getRestaurantsList(),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Server error",
            ),
          ),
        );
      },
    );
  });

  group('get restaurant detail', () {
    final Uri endPoint = Endpoint.restaurantDetail("abc123");

    group(
      '2xx-response code',
      () {
        test(
          'should return valid RestaurantModel when response is valid',
          () async {
            when(
              () => mockHttpClient.get(endPoint),
            ).thenAnswer(
              (_) async => http.Response(restaurantDetailResponseDummy, 200),
            );

            final result = await dataSource.getRestaurantDetail("abc123");

            expect(result, equals(restaurantDetailModelDummy));
          },
        );

        test(
          'should throw EmptyDataException when body response is empty',
          () async {
            when(
              () => mockHttpClient.get(endPoint),
            ).thenAnswer(
              (_) async => http.Response("", 200),
            );

            expect(
              () async => await dataSource.getRestaurantDetail("abc123"),
              throwsA(
                isA<EmptyDataException>().having(
                  (exception) => exception.message,
                  "Exception message",
                  "No data found",
                ),
              ),
            );
          },
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 400',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 400),
        );

        expect(
          () async => await dataSource.getRestaurantDetail("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Bad request",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 401',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 401),
        );

        expect(
          () async => await dataSource.getRestaurantDetail("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Unauthorized",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 404',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 404),
        );

        expect(
          () async => await dataSource.getRestaurantDetail("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Data not found",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 500',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 500),
        );

        expect(
          () async => await dataSource.getRestaurantDetail("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Server error",
            ),
          ),
        );
      },
    );
  });

  group('search restaurant', () {
    final Uri endPoint = Endpoint.searchRestaurant("abc123");

    group(
      '2xx-response code',
      () {
        test('should return valid list of RestaurantItemModel', () async {
          when(
            () => mockHttpClient.get(endPoint),
          ).thenAnswer(
            (_) async => http.Response(restaurantListResponseDummy, 200),
          );

          final result = await dataSource.searchRestaurant("abc123");

          expect(result, equals(restaurantListModelDummy));
        });

        test(
          'should throw EmptyDataException when body response is empty',
          () async {
            when(
              () => mockHttpClient.get(endPoint),
            ).thenAnswer(
              (_) async => http.Response("", 200),
            );

            expect(
              () async => await dataSource.searchRestaurant("abc123"),
              throwsA(
                isA<EmptyDataException>().having(
                  (exception) => exception.message,
                  "Exception message",
                  "No data found",
                ),
              ),
            );
          },
        );

        test(
          'should throw EmptyDataException when restasurant list response is empty',
          () async {
            when(
              () => mockHttpClient.get(endPoint),
            ).thenAnswer(
              (_) async => http.Response(emptyRestaurantListResponseDummy, 200),
            );

            expect(
              () => dataSource.searchRestaurant("abc123"),
              throwsA(
                isA<EmptyDataException>().having(
                  (exception) => exception.message,
                  "Exception message",
                  "Restaurant not found",
                ),
              ),
            );
          },
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 400',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 400),
        );

        expect(
          () async => await dataSource.searchRestaurant("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Bad request",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 401',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 401),
        );

        expect(
          () async => await dataSource.searchRestaurant("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Unauthorized",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 404',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 404),
        );

        expect(
          () async => await dataSource.searchRestaurant("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Data not found",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 500',
      () async {
        when(
          () => mockHttpClient.get(endPoint),
        ).thenAnswer(
          (_) async => http.Response("", 500),
        );

        expect(
          () async => await dataSource.searchRestaurant("abc123"),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Server error",
            ),
          ),
        );
      },
    );
  });

  group('add review', () {
    final Uri endPoint = Endpoint.addReview();
    final newReview = {
      'id': "Ahmad",
      'name': "Tidak rekomendasi untuk pelajar!",
      'review': "13 November 2019",
    };

    group(
      '2xx-response code',
      () {
        test(
          'should return customer review model',
          () async {
            when(
              () => mockHttpClient.post(endPoint, body: newReview),
            ).thenAnswer(
              (_) async => http.Response(addReviewResponseDummy, 200),
            );

            final result = await dataSource.addNewReview(newReview);

            expect(result, equals(customerReviewsModelDummy));
          },
        );

        test(
          'should throw EmptyDataException when body response is empty',
          () async {
            when(
              () => mockHttpClient.post(endPoint, body: newReview),
            ).thenAnswer(
              (_) async => http.Response("", 200),
            );

            expect(
              () async => await dataSource.addNewReview(newReview),
              throwsA(
                isA<EmptyDataException>().having(
                  (exception) => exception.message,
                  "Exception message",
                  "No data found",
                ),
              ),
            );
          },
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 400',
      () async {
        when(
          () => mockHttpClient.post(endPoint, body: newReview),
        ).thenAnswer(
          (_) async => http.Response("", 400),
        );

        expect(
          () async => await dataSource.addNewReview(newReview),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Bad request",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 401',
      () async {
        when(
          () => mockHttpClient.post(endPoint, body: newReview),
        ).thenAnswer(
          (_) async => http.Response("", 401),
        );

        expect(
          () async => await dataSource.addNewReview(newReview),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Unauthorized",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 404',
      () async {
        when(
          () => mockHttpClient.post(endPoint, body: newReview),
        ).thenAnswer(
          (_) async => http.Response("", 404),
        );

        expect(
          () async => await dataSource.addNewReview(newReview),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Data not found",
            ),
          ),
        );
      },
    );

    test(
      'should return throw FetchDataErrorException when status code 500',
      () async {
        when(
          () => mockHttpClient.post(endPoint, body: newReview),
        ).thenAnswer(
          (_) async => http.Response("", 500),
        );

        expect(
          () async => await dataSource.addNewReview(newReview),
          throwsA(
            isA<FetchDataErrorException>().having(
              (exception) => exception.message,
              "Exception message",
              "Server error",
            ),
          ),
        );
      },
    );
  });
}
