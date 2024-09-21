import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static final SharedPreferenceData _instance =
      SharedPreferenceData._internal();
  static SharedPreferences? _prefs;

  factory SharedPreferenceData() {
    return _instance;
  }

  SharedPreferenceData._internal();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _isLoggedInKey = 'isLoggedIn';

  Future<bool> isLoggedIn() async {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    await _prefs?.setBool(_isLoggedInKey, value);
  }

  Future<void> login() async {
    // Perform login logic here
    await setLoggedIn(true);
  }

  Future<void> logout() async {
    // Perform logout logic here
    await setLoggedIn(false);
  }
}
