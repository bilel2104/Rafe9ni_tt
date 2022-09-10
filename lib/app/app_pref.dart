import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBORDING_SCREEN = "PREFS_KEY_ONBORDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED = "PREDS_KEY_IS_USER_LOGGED";
const String idUser = "id";

class AppPreferences {
  SharedPreferences _sharedPreferences;

  Future<String> getId() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getInt(idUser).toString();
  }

  AppPreferences(this._sharedPreferences);

  Future<void> setOnBordingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBORDING_SCREEN, true);
  }

  Future<bool> isOnBordingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBORDING_SCREEN) ?? false;
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED) ?? false;
  }
}
