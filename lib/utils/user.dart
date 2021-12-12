import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class User {
  static Future<bool> Signup(var username, var password) async {
    final prefs = await SharedPreferences.getInstance();
    bool doesExist = prefs.containsKey(username);
    if (doesExist) {
      return false;
    }
    prefs.setString(username, password);

    return true;
  }

  static Future<bool> Login(var username, var password) async {
    final prefs = await SharedPreferences.getInstance();
    bool doesExist = prefs.containsKey(username);
    if (doesExist) {
      String? storedPassword = prefs.getString(username);
      if (storedPassword == password) {
        return true;
      }
    }
    return false;
  }
}
