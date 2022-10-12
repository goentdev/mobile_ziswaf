import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return User.fromJson(map);
  //     if (map is List) return map.map((item) => User.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'https://ziswaf-server.smarteschool.net/';
  // }

  Future<User?> profile() async {
    final response = await get(
      '$url/profile',
      headers: {'Authorization': 'bearer ${sharedPrefs.token}'},
    );
    return User.fromJson(response.body);
  }
}
