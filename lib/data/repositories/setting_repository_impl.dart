import 'package:restaurant_app/data/data.dart';
import 'package:restaurant_app/domain/domain.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingDataSource dataSource;

  SettingRepositoryImpl({required this.dataSource});

  @override
  Future<bool> getScheduleStatus() async {
    return await dataSource.getScheduleStatus();
  }

  @override
  Future<bool> setScheduleStatus(bool state) async {
    return await dataSource.setScheduleStatus(state);
  }
}
