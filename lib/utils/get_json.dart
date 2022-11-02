import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/commons/commons.dart';

Map<String, dynamic> getJsonFromResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      if (response.body.isEmpty) {
        throw const EmptyDataException();
      }
      return jsonDecode(response.body);

    case 400:
      throw const FetchDataErrorException('Bad request');

    case 401:
    case 403:
      throw const FetchDataErrorException('Unauthorized');

    case 404:
      throw const FetchDataErrorException('Data not found');

    case 500:
    default:
      throw const FetchDataErrorException('Server error');
  }
}
