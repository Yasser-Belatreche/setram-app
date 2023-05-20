import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  static Future<void> set(String key, String value) async {
    final store = await _getStore();

    store.setString(key, value);
  }

  static Future<String?> get(String key) async {
    final store = await _getStore();

    return store.getString(key);
  }

  static Future<void> delete(String key) async {
    final store = await _getStore();

    await store.remove(key);
  }

  static Future<SharedPreferences> _getStore() async {
    _prefs ??= await SharedPreferences.getInstance();

    return _prefs!;
  }
}
