
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  // Save Methods

  static Future<bool> saveBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

//get bool values
  static Future<bool> getBool(String key, {bool? defaultValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue!;
  }


//clear all data saved in shared preferences
  static Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }




}
