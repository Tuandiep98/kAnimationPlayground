import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<void> saveJsonData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    var valueJson = jsonEncode(value);
    await prefs.setString(key, valueJson);
  }

  static Future<dynamic> readJsonData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj != null ? jsonDecode(obj) : null;
  }
}
