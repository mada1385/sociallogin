import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String token = 'token';
  static const String fcmToken = 'fcmToken';
  static const String refreshToken = 'refreshToken';
  static const String appSettings = 'appSettings';
  static const String languageCode = 'language_code';
  static const String isDark = 'isDark';
  static const String userData = 'userData';
  static const String userLogged = 'userLogged';
  static const String baseUrl = 'baseUrl';
  static const String emergencytoken = 'emergencytoken';
  static const String STAGE_INDEX = 'stage_index';
  static const String INFO_ONBOARDING = 'info_onboarding';
  static const String USER_PASSWORD = 'user_password';
}

class Preference {
  static SharedPreferences _sb;
  static Future<void> init() async {
    if (_sb == null) _sb = await SharedPreferences.getInstance();
  }

  static String getString(String key) {
    try {
      return _sb.getString(key);
    } catch (e) {
      return null;
    }
  }

  static int getInt(String key) {
    try {
      return _sb.getInt(key);
    } catch (e) {
      return null;
    }
  }

  static bool getBool(String key) {
    try {
      return _sb.getBool(key);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> setString(String key, String value) async {
    final sb = await SharedPreferences.getInstance();
    try {
      return sb.setString(key, value);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> setInt(String key, int value) async {
    try {
      return _sb.setInt(key, value);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> setBool(String key, bool value) async {
    try {
      print(key);
      return await _sb.setBool(key, value);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> remove(String key) async {
    try {
      return await _sb.remove(key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> clear() async {
    try {
      return await _sb.clear();
    } catch (e) {
      return null;
    }
  }
}
