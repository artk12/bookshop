import 'package:shared_preferences/shared_preferences.dart';

class Sp {

  static void changeTheme(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', val);

  }
  static Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme')??false;
  }
}
