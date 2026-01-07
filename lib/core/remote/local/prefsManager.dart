import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs; // declare instance of Shared Preferences

  static init() async { // Future
    prefs = await SharedPreferences.getInstance(); // Init
  }

  static saveOnboardingSeen() {
    prefs.setBool("IsLast", true);
  }

  static bool isOnboardingSeen() {
    return prefs.getBool("IsLast") ?? false;
  }
}
