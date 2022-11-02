abstract class SettingRepository {
  Future<bool> setScheduleStatus(bool state);
  Future<bool> getScheduleStatus();
}
