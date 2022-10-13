import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Future<User?> profile() async {
    final response = await get(
      '$url/profile',
      headers: {'Authorization': 'bearer ${sharedPrefs.token}'},
    );
    return User.fromJson(response.body);
  }
}
