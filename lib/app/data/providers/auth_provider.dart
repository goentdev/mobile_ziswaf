import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AuthProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Future<bool> register({
    required String nama,
    required String email,
    // required String otp,
    required String whatsapp,
    required String role,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required String fotoKartuIdentitas,
    required int bankId,
    required String nomorRekening,
    required String namaRekening,
    required String password,
  }) async {
    final response = await post('$url/user/register', {
      "nama": nama,
      "email": email,
      // "otp": otp,
      "whatsapp": whatsapp,
      "role": role,
      "kategori": kategori,
      "jenis_kartu_identitas": jenisKartuIdentitas,
      "nomor_kartu_identitas": nomorKartuIdentitas,
      "foto_kartu_identitas": fotoKartuIdentitas,
      "bank_id": bankId,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
      "password": password,
    });

    if (response.status.isOk) {
      // EasyLoading.showSuccess('Berhasil register');
      sharedPrefs.setToken = response.body['token']['token'];
      sharedPrefs.setSkip = true;

      return true;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Akun sudah terdaftar');

      return false;
    } else {
      EasyLoading.showError('Terjadi masalah server');

      return false;
    }
  }

  Future<bool> registupdate(int id, Map body) async {
    final response = await put('$url/user/$id', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.status.isOk) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> konfirmasiOtp({required String otp}) async {
    var urlpost = Uri.parse('$url/user/konfirmasi');
    final response = await http.post(urlpost, headers: {
      'Authorization': 'bearer ${sharedPrefs.token}'
    }, body: {
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
    } else {
      EasyLoading.showError('Whatsapp atau password salah');

      return false;
    }
  }
}
