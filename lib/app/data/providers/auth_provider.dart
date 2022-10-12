import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

class AuthProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Future<bool> register({
    required String nama,
    required String email,
    required String whatsapp,
    required String role,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required int bankId,
    required String nomorRekening,
    required String namaRekening,
    required String password,
  }) async {
    final response = await post('$url/user/register', {
      "nama": nama,
      "email": email,
      "whatsapp": whatsapp,
      "role": role,
      "kategori": kategori,
      "jenis_kartu_identitas": jenisKartuIdentitas,
      "nomor_kartu_identitas": nomorKartuIdentitas,
      "bank_id": bankId,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
      "password": password,
    });

    if (response.status.isOk) {
      EasyLoading.showSuccess('Berhasil register');
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
