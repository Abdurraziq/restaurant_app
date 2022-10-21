import 'package:flutter/material.dart';
import 'package:restaurant_app/data/datasources/data_source.dart';
import 'package:restaurant_app/data/datasources/data_source_impl.dart';
import 'package:restaurant_app/data/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_app/presentation/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/presentation/pages/restaurant_list_page.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataSource dataSource = DataSourceImpl(context: context);
    RestaurantRepository repository = RestaurantRepositoryImpl(
      dataSource: dataSource,
    );

    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF6750A4),
        useMaterial3: true,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) =>
            RestaurantListPage(repository: repository),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
