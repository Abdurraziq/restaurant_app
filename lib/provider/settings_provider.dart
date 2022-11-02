import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/date_time_helper.dart';

class SettingsProvider with ChangeNotifier {
  final SettingRepository repository;

  SettingsProvider(this.repository) {
    getScheduleState();
  }

  bool _scheduleState = false;
  bool get scheduleState => _scheduleState;

  void getScheduleState() async {
    _scheduleState = await repository.getScheduleStatus();
    notifyListeners();
  }

  void settingSchedule(bool state) async {
    final setAlarmResult = state
        ? await AndroidAlarmManager.periodic(
            const Duration(hours: 24),
            1,
            BackgroundService.callback,
            startAt: DateTimeHelper.format(),
            exact: true,
            wakeup: true,
          )
        : !await AndroidAlarmManager.cancel(1);
    _scheduleState = await repository.setScheduleStatus(setAlarmResult);
    notifyListeners();
  }
}
