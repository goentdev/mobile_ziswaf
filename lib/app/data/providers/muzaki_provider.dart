import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../modules/mainpage/MuzakkiPage/controllers/tambah_ubah_muzakki_controller.dart';
import '../../utils/shared_preferences.dart';
import '../models/muzaki_model.dart';
import '../models/totalmuzaki_model.dart';

class MuzakiProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';
  final controllerC = Get.put(TambahUbahMuzakkiController());

  Dio dio = Dio();

  Future<List<Muzaki>> getMuzakisall(int? id) async {
    final response = await dio.get('$url/muzaki?user_id=$id',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
      var data = response.data['muzaki']['muzaki']['data'];
      List<Muzaki> muzaki = [];
      data.forEach((e) => {muzaki.add(Muzaki.fromJson(e))});
      return muzaki;
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<Totalmuzaki?> getTotalMuzakis(int? id) async {
    final response = await dio.get('$url/muzaki?user_id=$id',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
      var data = response.data['muzaki'];
      return Totalmuzaki.fromJson(data);
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<List<Muzaki>> getMuzakis(String? kategori) async {
    final response = await dio.get('$url/muzaki?kategori=$kategori',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
      var data = response.data['muzaki']['muzaki'];
      List<Muzaki> muzaki = [];
      data.forEach((e) => {muzaki.add(Muzaki.fromJson(e))});
      return muzaki;
    } else {
      throw EasyLoading.showError('Server Error! Coba lagi nanti');
    }
  }

  Future<String> tambahMuzakki({
    required String nama,
    required String whatsapp,
    required String email,
    required String kategori,
    required String tipe,
  }) async {
    controllerC.isLoading.value = true;
    var urlpost = ('$url/muzaki/tambah');
    final response = await dio.post(urlpost,
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}),
        data: {
          "nama": nama,
          "email": email,
          "whatsapp": whatsapp,
          "kategori": kategori,
          "tipe": tipe,
          "role": "muzaki"
        });

    if (response.statusCode == 200) {
      return 'Berhasil';
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Nomor whatsapp sudah terdaftar');
      return 'Gagal';
    } else {
      EasyLoading.showError('Gagal update muzaki');
      return 'Gagal';
    }
  }

  Future<bool> changeMuzaki(int id, Map body) async {
    final response = await dio.put('$url/muzaki/$id',
        data: body,
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Nomor whatsapp sudah terdaftar');
      return false;
    } else {
      EasyLoading.showError('Gagal update muzaki');
      return false;
    }
  }

  Future<void> deleteMuzaki(int id) async => await dio.delete('$url/muzaki/$id',
      options:
          Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
}
