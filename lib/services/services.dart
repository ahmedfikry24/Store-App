import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

class Services {
  static bool? onboarding;
  static bool? homepage;
  getInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
