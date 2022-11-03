import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  Future<bool> changeProfile(
    int id,
    Map body,
  ) async {
    final response = await put('$url/user/$id', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.status.isOk) {
      return true;
    } else {
      EasyLoading.showError('Gagal update profile');
      return false;
    }
  }

  Future<bool> changepassword({
    required String passwordbaru,
    required String passwordlama,
  }) async {
    final response = await post('$url/user/reset-password', headers: {
      'Authorization': 'bearer ${sharedPrefs.token}'
    }, {
      'password_lama': passwordlama,
      'password_baru': passwordbaru,
    });
    if (response.status.isOk) {
      EasyLoading.showSuccess('Berhasil ubah password');
      return true;
    } else if (response.statusCode == 422) {
      EasyLoading.showError('Password lama tidak sesuai');
      return false;
    } else {
      EasyLoading.showError('Password lama tidak sesuai');
      return false;
    }
  }
}
