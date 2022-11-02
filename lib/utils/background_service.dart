import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/commons/api_state.dart';
import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/utils/utils.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: http.Client(),
    );
    final RemoteRepository repository = RemoteRepositoryImpl(
      dataSource: dataSource,
    );

    final response = await repository.getRestaurantsList();

    if (response is OnDataLoaded<List<Restaurant>>) {
      final result = response.data;
      final randomeIndex = Random().nextInt(result.length);
      final featuredRestaurant = result[randomeIndex];

      await notificationHelper.showNotification(
        notificationsPlugin,
        featuredRestaurant,
      );

      _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
      _uiSendPort?.send(null);
    }
  }
}
