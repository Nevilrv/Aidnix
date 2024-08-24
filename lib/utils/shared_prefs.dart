import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
    _preferences?.reload();
  }

  static const token = "token";
  static const userId = "userId";
  static const fcmToken = "fcmToken";
  static const externalId = "externalId";

  clear() async {
    await _preferences?.clear();
    await _preferences?.reload();
  }

  Future<bool?> setString(String key, String value) async {
    _preferences?.reload();
    return _preferences?.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    _preferences?.reload();
    return _preferences == null ? defValue : _preferences?.getString(key) ?? defValue;
  }

  Future<bool?> setInt(String key, int value) async {
    _preferences?.reload();
    return _preferences?.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    _preferences?.reload();
    return _preferences == null ? defValue : _preferences?.getInt(key) ?? defValue;
  }

  Future<bool?> setDouble(String key, double value) async {
    _preferences?.reload();
    return _preferences?.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    _preferences?.reload();
    return _preferences == null ? defValue : _preferences?.getDouble(key) ?? defValue;
  }

  Future<bool?> setBool(String key, bool value) async {
    _preferences?.reload();
    return _preferences?.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    _preferences?.reload();
    return _preferences == null ? defValue : _preferences?.getBool(key) ?? defValue;
  }
}
