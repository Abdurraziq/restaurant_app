import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

const restaurantDetailResponseDummy = '''{
  "error": false,
  "message": "success",
  "restaurant": {
    "id": "rqdv5juczeskfw1e867",
    "name": "Melting Pot",
    "description": "Lorem ipsum dolor sit amet.",
    "city": "Medan",
    "address": "Jln. Pandeglang no 19",
    "pictureId": "14",
    "rating": 4.2,
    "categories": [
      {
        "name": "Italia"
      }
    ],
    "menus": {
      "foods": [
        {
          "name": "Paket rosemary"
        },
        {
          "name": "Toastie salmon"
        }
      ],
      "drinks": [
        {
          "name": "Es krim"
        },
        {
          "name": "Sirup"
        }
      ]
    },
    "customerReviews": [
      {
        "name": "Ahmad",
        "review": "Tidak rekomendasi untuk pelajar!",
        "date": "13 November 2019"
      }
    ]
  }
}''';

const RestaurantModel restaurantDetailModelDummy = RestaurantModel(
  id: "rqdv5juczeskfw1e867",
  name: "Melting Pot",
  description: "Lorem ipsum dolor sit amet.",
  city: "Medan",
  address: "Jln. Pandeglang no 19",
  pictureId: "14",
  rating: 4.2,
  categories: [
    CategoryModel(name: "Italia"),
  ],
  menus: MenusModel(
    foods: [
      FoodModel(name: "Paket rosemary"),
      FoodModel(name: "Toastie salmon"),
    ],
    drinks: [
      DrinkModel(name: "Es krim"),
      DrinkModel(name: "Sirup"),
    ],
  ),
  customerReviews: [
    CustomerReviewModel(
      name: "Ahmad",
      review: "Tidak rekomendasi untuk pelajar!",
      date: "13 November 2019",
    ),
  ],
);

ApiState<RestaurantDetail> restaurantDetailEntityDummy = OnDataLoaded(
  const RestaurantDetail(
    id: "rqdv5juczeskfw1e867",
    name: "Melting Pot",
    description: "Lorem ipsum dolor sit amet.",
    city: "Medan",
    pictureId: "14",
    rating: 4.2,
    categories: [
      Category(name: "Italia"),
    ],
    menus: Menus(
      foods: [
        Menu(name: "Paket rosemary"),
        Menu(name: "Toastie salmon"),
      ],
      drinks: [
        Menu(name: "Es krim"),
        Menu(name: "Sirup"),
      ],
    ),
    reviews: [
      CustomerReview(
        name: "Ahmad",
        review: "Tidak rekomendasi untuk pelajar!",
        date: "13 November 2019",
      ),
    ],
  ),
);
