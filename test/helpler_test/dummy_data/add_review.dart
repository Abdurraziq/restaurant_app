import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

const addReviewResponseDummy = '''{
  "error": false,
  "message": "success",
  "customerReviews": [
    {
      "name": "Ahmad",
      "review": "Tidak rekomendasi untuk pelajar!",
      "date": "13 November 2019"
    },
    {
      "name": "Budi",
      "review": "UUuhh enakkkkk",
      "date": "2 November 2022"
    }
  ]
}''';

const List<CustomerReviewItem> customerReviewsModelDummy = [
  CustomerReviewItem(
    name: "Ahmad",
    review: "Tidak rekomendasi untuk pelajar!",
    date: "13 November 2019",
  ),
  CustomerReviewItem(
    name: "Budi",
    review: "UUuhh enakkkkk",
    date: "2 November 2022",
  ),
];

ApiState<List<CustomerReview>> customerReviewsEntityDummy = OnDataLoaded(
  const [
    CustomerReview(
      name: "Budi",
      review: "UUuhh enakkkkk",
      date: "2 November 2022",
    ),
    CustomerReview(
      name: "Ahmad",
      review: "Tidak rekomendasi untuk pelajar!",
      date: "13 November 2019",
    ),
  ],
);
