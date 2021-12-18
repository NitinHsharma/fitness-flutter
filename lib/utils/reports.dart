import 'package:shared_preferences/shared_preferences.dart';

class ReportResponse {
  double bmi = 0;
  double bmr = 0;
  double calorie = 0;

  String today = "";
  String week = "";

  double todaysFat = 0;
  double todaysCarbs = 0;
  double todaysProtin = 0;
  double weekFat = 0;
  double weekCarbs = 0;
  double weekProtin = 0;

  //constructor
  ReportResponse(
    this.todaysFat,
    this.todaysCarbs,
    this.todaysProtin,
    this.weekFat,
    this.weekCarbs,
    this.weekProtin,
    this.bmi,
    this.bmr,
    this.calorie,
    this.today,
    this.week,
  );

  static ReportResponse empty() {
    return ReportResponse(
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      "",
      "",
    );
  }
}

class Reports {
  static Future<ReportResponse> getReports() async {
    // get today's date
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";
    DateTime weekAgo = DateTime.now().subtract(Duration(days: 7));
    String week = "${weekAgo.year}-${weekAgo.month}-${weekAgo.day} -- $today";
    String carbsKey = 'carbs_$today';
    String protinKey = 'protin_$today';
    String fatKey = 'fat_$today';
    print(carbsKey);
    double todaysCarbs = await getSafeValue(carbsKey);
    double todaysProtin = await getSafeValue(protinKey);
    double todaysFat = await getSafeValue(fatKey);

    print("todaysCarbs: $todaysCarbs");

    double weekCarbs = todaysCarbs;
    double weekProtin = todaysProtin;
    double weekFat = todaysFat;

    for (var i = 1; i < 6; i++) {
      DateTime date = now.subtract(Duration(days: i));
      String carbsKey = 'carbs_${date.year}-${date.month}-${date.day}';
      String protinKey = 'protin_${date.year}-${date.month}-${date.day}';
      String fatKey = 'fat_${date.year}-${date.month}-${date.day}';

      double carbs = await getSafeValue(carbsKey);
      double protin = await getSafeValue(protinKey);
      double fat = await getSafeValue(fatKey);

      weekCarbs += carbs;
      weekProtin += protin;
      weekFat += fat;
    }
    double bmi = await getBMI();
    double bmr = await getBMR();

    ReportResponse returnObj = ReportResponse(
      todaysFat,
      todaysCarbs,
      todaysProtin,
      weekFat,
      weekCarbs,
      weekProtin,
      bmi,
      bmr,
      (bmr * 0.55).ceilToDouble(),
      today,
      week,
    );

    print("Sending ${returnObj.toString()}");
    return returnObj;
  }

  static Future<double> getSafeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? val = prefs.getString(key);
      print("key $key and value $val");
      if (val == null) {
        return 0;
      }
      return double.parse(val);
    } catch (e) {
      return 0;
    }
  }

  static Future<bool> setReports(
    double inputCarbs,
    double inputProtein,
    double inputFat,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get the today date
    DateTime now = DateTime.now();

    String carbsKey = 'carbs_${now.year}-${now.month}-${now.day}';
    String protinKey = 'protin_${now.year}-${now.month}-${now.day}';
    String fatKey = 'fat_${now.year}-${now.month}-${now.day}';
    print("Setting $carbsKey");
    double carbs = await getSafeValue(carbsKey) + inputCarbs;
    double protin = await getSafeValue(protinKey) + inputProtein;
    double fat = await getSafeValue(fatKey) + inputFat;

    prefs.setString(carbsKey, carbs.toString());
    prefs.setString(protinKey, protin.toString());
    prefs.setString(fatKey, fat.toString());
    return true;
  }

  static Future<double> getBMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? height = prefs.getString("height");
      String? weight = prefs.getString("weight");
      int h = height == null ? 158 : int.parse(height);
      int w = weight == null ? 75 : int.parse(weight);

      return (w / (h * h) * 10000).ceilToDouble();
    } catch (e) {
      return 0;
    }
  }

  static Future<double> getBMR() async {
    // calculate bmr
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? height = prefs.getString("height");
    String? weight = prefs.getString("weight");
    String? age = prefs.getString("age");
    String? gender = prefs.getString("gender");

    int a = age == null ? 18 : int.parse(age);
    double h = height == null ? 158 : double.parse(height);
    double w = weight == null ? 70 : double.parse(weight);

    if (gender == 'Male') {
      return (88.362 + (13.397 * w) + (4.799 * h) - (5.677 * a)).ceilToDouble();
    } else {
      return (447.593 + (9.247 * w) + (3.098 * h) - (4.330 * a)).ceilToDouble();
    }
  }
}
