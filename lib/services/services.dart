import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

class Services {
  static bool? onboarding;
  getInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
