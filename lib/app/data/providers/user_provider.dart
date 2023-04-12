import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final String url = 'https://server.yayasanyamini.com';
  Dio dio = Dio();

  Future<User?> profile() async {
    var urlget = ('$url/profile');
    final response = await dio.get(
      urlget,
      options:
          Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}),
    );
    return User.fromJson(response.data);
  }

  Future<bool> changeProfile(
    int id,
    Map body,
  ) async {
    final response = await dio.put('$url/user/$id',
        data: body,
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
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
    final response = await dio.post('$url/user/reset-password',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}),
        data: {
          'password_lama': passwordlama,
          'password_baru': passwordbaru,
        });
    if (response.statusCode == 200) {
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

  Future<bool> forgotpassword({required String email}) async {
    final response = await dio.post('$url/user/kirim-email', data: {
      'email': email,
    });
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Berhasil Mengirim Ke Email');
      return true;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Email Belum Terdaftar');
      return false;
    } else {
      EasyLoading.showError('Terjadi Server Error');
      return false;
    }
  }
}
