import 'package:shared_preferences/shared_preferences.dart';
import 'package:preferenceuserapp/src/pages/home_pages.dart';

class PreferenceUser {
  static final PreferenceUser _instancia = PreferenceUser._internal();

  factory PreferenceUser() {
    return _instancia;
  }

  PreferenceUser._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET AND SET GENERO
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set setGender(int value) {
    _prefs.setInt('gender', value);
  }

  // GET AND SET Secundary Color
  get colorSecundary {
    return _prefs.getBool('colorSecundary') ?? false;
  }

  set setColorSecundary(bool value) {
    _prefs.setBool('colorSecundary', value);
  }

  // GET AND SET Name user
  get nameUser {
    return _prefs.getString('nameUser') ?? '';
  }

  set setNameUser(String value) {
    _prefs.setString('nameUser', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set setLastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
