import '../shared/shared_prefs_constant.dart';

class CacheProvider {
  String? getStringCache(String key) {
    return SharedPreferencesConstant.instance.getStringValue(key);
  }

  int? getIntCache(String key) {
    return SharedPreferencesConstant.instance.getIntValue(key);
  }

  bool? getBoolCache(String key) {
    return SharedPreferencesConstant.instance.getBoolValue(key);
  }

  Future<void> clearCache() {
    return SharedPreferencesConstant.instance.clearCache();
  }

  Future<void> removeCache(String key) {
    return SharedPreferencesConstant.instance.removeCache(key);
  }
}
