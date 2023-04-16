import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AuthProvider extends GetConnect {
  final String url = 'https://server.yayasanyamini.com';

  Future<bool> register({
    required String nama,
    required String email,
    // required String otp,
    required String whatsapp,
    required int status,
    required String role,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required String fotoKartuIdentitas,
    required String password,
  }) async {
    final response = await post('$url/user/register', {
      "nama": nama,
      "email": email,
      // "otp": otp,
      "whatsapp": whatsapp,
      "status": status,
      "tingkat": 'Madya',
      "role": role,
      "kategori": kategori,
      "jenis_kartu_identitas": jenisKartuIdentitas,
      "nomor_kartu_identitas": nomorKartuIdentitas,
      "foto_kartu_identitas": fotoKartuIdentitas,
      "password": password,
    });

    if (response.statusCode == 200) {
      // EasyLoading.showSuccess('Berhasil register');
      sharedPrefs.setToken = response.body['token']['token'];
      sharedPrefs.setSkip = true;

      return true;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Akun sudah terdaftar');

      return false;
    } else if (response.statusCode == 500) {
      EasyLoading.showError('Server OTP Error');

      return false;
    } else {
      EasyLoading.showError('Terjadi masalah server');

      return false;
    }
  }

  Future<bool> registupdate(int id, Map body) async {
    final response = await put('$url/user/$id', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> konfirmasiOtp({required String otp}) async {
    var urlpost = ('$url/user/konfirmasi');
    final response = await post(urlpost, headers: {
      'Authorization': 'bearer ${sharedPrefs.token}'
    }, {
      'otp': otp,
    });

    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Otp Benar');
      return true;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Kode Salah');
      return false;
    } else {
      return false;
    }
  }

  //

  Future<bool> resendotpp(
    Map body,
  ) async {
    final response = await put('$url/user/kode-otp', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    if (response.status.isOk) {
      return true;
    } else {
      EasyLoading.showError('Gagal update profile');
      return false;
    }
  }

  Future<bool> login({
    required String whatsapp,
    required String password,
  }) async {
    final response = await post('$url/user/login', {
      "whatsapp": whatsapp,
      "password": password,
    });

    if (response.status.isOk) {
      EasyLoading.showSuccess('Berhasil login');
      sharedPrefs.setToken = response.body['token']['token'];
      sharedPrefs.setSkip = true;

      return true;
    } else if (response.status.isNotFound) {
      EasyLoading.showError('Akun belum terdaftar');

      return false;
    } else if (response.status.isServerError) {
      EasyLoading.showError('Terjadi masalah server');

      return false;
    } else if (response.status.connectionError) {
      EasyLoading.showError('Koneksi Anda Error Mohon Dicoba Kembali');

      return false;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Whatsapp atau password salah');

      return false;
    } else {
      EasyLoading.showError('Server Error Mohon dicoba Kembali');
      return false;
    }
  }
}
