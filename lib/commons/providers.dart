import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/single_child_widget.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/provider/provider.dart';

List<SingleChildWidget> get providers {
  RemoteDataSource dataSource = RemoteDataSourceImpl(client: http.Client());
  RemoteRepository repository = RemoteRepositoryImpl(
    dataSource: dataSource,
  );

  FavoriteDataSource favortieDataSource = FavoriteDataSourceImpl();
  FavoriteRepository favoriteRepository =
      FavoriteRepositoryImpl(favoriteDataSource: favortieDataSource);

  SettingDataSource settingDataSource = SettingDataSourceImpl();
  SettingRepository settingRepository = SettingRepositoryImpl(
    dataSource: settingDataSource,
  );

  return [
    ChangeNotifierProvider<PagesProvider>(
      create: (_) => PagesProvider(),
    ),
    ChangeNotifierProvider<ListProvider>(
      create: (_) => ListProvider(repository),
    ),
    ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(repository),
    ),
    ChangeNotifierProvider<ReviewProvider>(
      create: (_) => ReviewProvider(repository),
    ),
    ChangeNotifierProvider<FavoriteProvider>(
      create: (_) => FavoriteProvider(favoriteRepository),
    ),
    ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(settingRepository),
    )
  ];
}
