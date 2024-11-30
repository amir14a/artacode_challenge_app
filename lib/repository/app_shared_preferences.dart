import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPreferences {
  static saveLoggedIn() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setBool(Consts.isLoginKey, true);
  }

  static saveFirstLaunch() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setBool(Consts.isFirstLaunchKey, false);
  }

  static Future<bool> getIsLoggedIn() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getBool(Consts.isLoginKey) ?? false;
  }

  static Future<bool> getIsFirstLaunch() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getBool(Consts.isFirstLaunchKey) ?? true;
  }

  static clearAll() async {
    var instance = await SharedPreferences.getInstance();
    await instance.clear();
  }
}
