import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/provider.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataSource dataSource = DataSourceImpl(client: http.Client());
    RestaurantRepository repository = RestaurantRepositoryImpl(
      dataSource: dataSource,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(
          create: (_) => ListProvider(repository),
        ),
        ChangeNotifierProvider<DetailProvider>(
          create: (context) => DetailProvider(repository),
        ),
        ChangeNotifierProvider<ReviewProvider>(
          create: (_) => ReviewProvider(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF6750A4),
          useMaterial3: true,
        ),
        initialRoute: RestaurantListPage.routeName,
        routes: {
          RestaurantListPage.routeName: (_) => const RestaurantListPage(),
          RestaurantDetailPage.routeName: (_) => const RestaurantDetailPage(),
        },
      ),
    );
  }
}
