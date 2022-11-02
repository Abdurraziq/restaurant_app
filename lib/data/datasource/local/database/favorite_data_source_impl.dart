import 'package:path/path.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDataSourceImpl implements FavoriteDataSource {
  static FavoriteDataSourceImpl? _favoriteDataSourceImpl;
  static late Database _database;

  FavoriteDataSourceImpl._internal() {
    _favoriteDataSourceImpl = this;
  }

  factory FavoriteDataSourceImpl() =>
      _favoriteDataSourceImpl ?? FavoriteDataSourceImpl._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableName = 'favorite_resto';
  static const int _dbVersion = 1;

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'note_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXt,
            rating DOUBLE
          )''',
        );
      },
      version: _dbVersion,
    );

    return db;
  }

  @override
  Future setFavoriteRestaurant(RestaurantItemModel restaurant) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      restaurant.toJson(),
    );
  }

  @override
  Future deleteFavoriteRestaurant(String id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<RestaurantItemModel>> getFavoriteRestaurants() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results
        .map((restaurant) => RestaurantItemModel.fromJson(restaurant))
        .toList();
  }

  Future<RestaurantItemModel> _getFavoriteRestaurantById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return results
        .map((restaurant) => RestaurantItemModel.fromJson(restaurant))
        .first;
  }

  @override
  Future<bool> isFavoriteRestaurant(String id) async {
    try {
      await _getFavoriteRestaurantById(id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
