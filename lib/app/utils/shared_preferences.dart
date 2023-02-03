import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? get token => _sharedPrefs!.getString('token');

  String? get bukti => _sharedPrefs!.getString('bukti');

  bool? get skipIntro => _sharedPrefs!.getBool('skip_intro');

  set setToken(String value) {
    _sharedPrefs!.setString('token', value);
  }

  set setBukti(String value) {
    _sharedPrefs!.setString('bukti', value);
  }

  set setSkip(bool value) {
    _sharedPrefs!.setBool('skip_intro', value);
  }

  logout() {
    _sharedPrefs!.remove('token');
  }
}

final sharedPrefs = SharedPrefs();
