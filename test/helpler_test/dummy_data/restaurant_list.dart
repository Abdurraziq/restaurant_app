import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

const restaurantListResponseDummy = '''{
  "error": false,
  "message": "success",
  "count": 20,
  "restaurants": [
    {
      "id": "abc123",
      "name": "Melting Pot",
      "description": "Lorem ipsum.",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    },
    {
      "id": "def321",
      "name": "Kafe Kita",
      "description": "Quisque rutrum.",
      "pictureId": "25",
      "city": "Gorontalo",
      "rating": 4
    }
  ]
}''';

const emptyRestaurantListResponseDummy = '''{
  "error": false,
  "message": "success",
  "count": 20,
  "restaurants": []
}''';

List<RestaurantItemModel> restaurantListModelDummy = [
  const RestaurantItemModel(
    id: "abc123",
    name: "Melting Pot",
    description: "Lorem ipsum.",
    pictureId: "14",
    city: "Medan",
    rating: 4.2,
  ),
  const RestaurantItemModel(
    id: "def321",
    name: "Kafe Kita",
    description: "Quisque rutrum.",
    pictureId: "25",
    city: "Gorontalo",
    rating: 4,
  )
];

ApiState<List<Restaurant>> restaurantListEntityDummy = OnDataLoaded(
  const [
    Restaurant(
      id: "abc123",
      name: "Melting Pot",
      description: "Lorem ipsum.",
      pictureId: "14",
      city: "Medan",
      rating: 4.2,
    ),
    Restaurant(
      id: "def321",
      name: "Kafe Kita",
      description: "Quisque rutrum.",
      pictureId: "25",
      city: "Gorontalo",
      rating: 4,
    )
  ],
);
