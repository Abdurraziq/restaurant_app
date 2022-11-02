import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/utils/get_json.dart';

void main() {
  group("On 2xx response status", () {
    test("Should return valid json on non-empty body", () {
      const bodyResponse = '''{"data": "data"}''';
      final response = http.Response(bodyResponse, 200);

      expect(
        getJsonFromResponse(response),
        equals({"data": "data"}),
      );
    });

    test("Should throw EmptyDataException a on empty body", () {
      final response = http.Response('', 200);

      expect(
        () => getJsonFromResponse(response),
        throwsA(
          isA<EmptyDataException>().having(
            (exception) => exception.message,
            "Exception message",
            "No data found",
          ),
        ),
      );
    });
  });

  group('On 400 response status', () {
    test("Should throw FetchDataErrorException", () {
      final response = http.Response('', 400);

      expect(
        () => getJsonFromResponse(response),
        throwsA(
          isA<FetchDataErrorException>().having(
            (exception) => exception.message,
            "Exception message",
            "Bad request",
          ),
        ),
      );
    });
  });

  group('On 401 response status', () {
    test("Should throw FetchDataErrorException", () {
      final response = http.Response('', 401);

      expect(
        () => getJsonFromResponse(response),
        throwsA(
          isA<FetchDataErrorException>().having(
            (exception) => exception.message,
            "Exception message",
            "Unauthorized",
          ),
        ),
      );
    });
  });

  group('On 404 response status', () {
    test("Should throw FetchDataErrorException", () {
      final response = http.Response('', 404);

      expect(
        () => getJsonFromResponse(response),
        throwsA(
          isA<FetchDataErrorException>().having(
            (exception) => exception.message,
            "Exception message",
            "Data not found",
          ),
        ),
      );
    });
  });

  group('On 500 response status', () {
    test("Should throw FetchDataErrorException", () {
      final response = http.Response('', 500);

      expect(
        () => getJsonFromResponse(response),
        throwsA(
          isA<FetchDataErrorException>().having(
            (exception) => exception.message,
            "Exception message",
            "Server error",
          ),
        ),
      );
    });
  });
}
