import 'package:shared_preferences/shared_preferences.dart';

class User {
  static Future<bool> Signup(
    var username,
    var password,
    var height,
    var weight,
    var age,
    var gender,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    bool doesExist = prefs.containsKey(username);
    if (doesExist) {
      return false;
    }
    prefs.setString(username, password);
    prefs.setString("weight", weight);
    prefs.setString("height", height);
    prefs.setString("age", age);
    prefs.setString("gender", gender);

    return true;
  }

  static Future<bool> Login(
    var username,
    var password,
  ) async {
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

  static Future<bool> Update(
    var height,
    var weight,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("weight", weight.toString());
    prefs.setString("height", height.toString());
    return true;
  }
}
