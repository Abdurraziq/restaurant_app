import 'package:restaurant_app/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingDataSourceImpl implements SettingDataSource {
  @override
  Future<bool> setScheduleStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isScheduled", status);
    return status;
  }

  @override
  Future<bool> getScheduleStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isScheduled") ?? false;
  }
}
