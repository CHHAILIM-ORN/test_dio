import 'package:shared_preferences/shared_preferences.dart';

class FlexiFuncAsync {
  static getDataAsyncStr(String key) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString(key);
    } catch (e) {
      throw Exception("Error Catch In getDataAsyncStr:" + e);
    }
  }

  static storeDataAsyncStr(String key, value) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(key, value);
    } catch (e) {
      throw Exception("Error Catch In storeDataAsyncStr:" + e);
    }
  }

  static removeStoreDataAsyncStr(String key) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove(key);
    } catch (e) {
      throw Exception("Error Catch In removeStoreDataAsyncStr:" + e);
    }
  }

  static getDataAsyncBool(String key) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return (pref.getBool(key) ?? false);
    } catch (e) {
      throw Exception("Error Catch In getDataAsyncBool:" + e);
    }
  }

  static storeDataAsyncBool(String key, bool value) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool(key, value);
    } catch (e) {
      throw Exception("Error Catch In storeDataAsyncBool:" + e);
    }
  }
}
