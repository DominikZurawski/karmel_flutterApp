import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'karmel_model.dart';

class SharedPreferencesHelper {
  // ignore: non_constant_identifier_names
  static final String _offline_cache_key = 'karmel_appListResponse';

  static Future<Karmel_appList?> getCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString(_offline_cache_key);
    final offlineData = cache != null ? karmel_appListFromJson(cache) : null;

    return offlineData;
  }

  static Future<bool> setCache(dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_offline_cache_key, jsonEncode(value));
  }
}