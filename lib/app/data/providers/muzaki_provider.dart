import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../modules/mainpage/MuzakkiPage/controllers/tambah_ubah_muzakki_controller.dart';
import '../../utils/shared_preferences.dart';
import '../models/muzaki_model.dart';

class MuzakiProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';
  final controllerC = Get.put(TambahUbahMuzakkiController());

  Future<List<Muzaki>> getMuzakis(int? id) async {
    final response = await get('$url/muzaki?user_id=$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.statusCode == 200) {
      var data = response.body['muzaki']['muzaki']['data'];
      List<Muzaki> muzaki = [];
      data.forEach((e) => {muzaki.add(Muzaki.fromJson(e))});
      return muzaki;
    } else {
      throw 'Server Error! Coba lagi nanti';
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
    var urlpost = Uri.parse('$url/muzaki/tambah');
    final response = await http.post(urlpost, headers: {
      'Authorization': 'bearer ${sharedPrefs.token}'
    }, body: {
      "nama": nama,
      "email": email,
      "whatsapp": whatsapp,
      "kategori": kategori,
      "tipe": tipe,
      "role": "muzaki"
    });

    if (response.statusCode == 200) {
      return 'Berhasil';
    } else {
      return 'Gagal';
    }
  }

  Future<bool> changeMuzaki(int id, Map body) async {
    final response = await put('$url/muzaki/$id', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    if (response.status.isOk) {
      return true;
    } else {
      EasyLoading.showError('Gagal update muzaki');
      return false;
    }
  }

  Future<Response> deleteMuzaki(int id) async =>
      await delete('$url/muzaki/$id');
}
