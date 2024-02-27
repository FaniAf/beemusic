import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  // STORING KEYS
  static const String _userId = 'userId';

//storing
  static Future<void> storingUserID(String userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Map<String, dynamic> mapUser = loginId.toJson();
    // String stringUser = jsonEncode(loginId);
    preferences.setString(_userId, userId);
  }

//retrieve
  static Future<String?> retrieveLoginID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? result = preferences.getString(_userId);
    return result;
  }

//remove

  static Future<bool> removeLoginID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(_userId);
    return true;
  }
}
