import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/alokasidana_model.dart';
import 'package:mobile_ziswaf/app/data/models/jenisdonasis_model.dart';

import '../../utils/shared_preferences.dart';
import '../models/transaksi_model.dart';

class TransaksiProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Future<List<Transaksi>> getTransaksi(int? id) async {
    final response = await get('$url/relawan-program/$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    if (response.statusCode == 200) {
      var data = response.body['transaksi']['data'];
      List<Transaksi> transaksi = [];
      data.forEach((e) => {transaksi.add(Transaksi.fromJson(e))});
      return transaksi;
    } else {
      throw EasyLoading.showError('Server Error! Coba lagi nanti');
    }
  }

  Future<List<Alokasidana>> getAlokasiDana(int? id) async {
    final response = await get('$url/transaksi/$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    if (response.statusCode == 200) {
      var data = response.body['alokasiDana'];
      List<Alokasidana> alokasi = [];
      data.forEach((e) => {alokasi.add(Alokasidana.fromJson(e))});
      return alokasi;
    } else {
      throw EasyLoading.showError('Server Error! Coba lagi nanti');
    }
  }

  Future<List<Jenisdonasis>> getJenisDonasi(int? id) async {
    final response = await get('$url/alokasi?program_id=$id');
    if (response.status.isOk) {
      List<dynamic> donasi = response.body;
      return donasi.map((e) => Jenisdonasis.fromJson(e)).toList();
    } else {
      throw EasyLoading.showError('Server Error! Coba lagi nanti');
    }
  }

  Future<bool> changeTransaksi(int id, Map body) async {
    final response = await put('$url/transaksi/$id', body,
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.status.isOk) {
      return true;
    } else {
      EasyLoading.showError('Gagal update muzaki');
      return false;
    }
  }

  Future<Response<Transaksi>> postTransaksi(Transaksi transaksi) async =>
      await post('transaksi', transaksi);
  Future<Response> deleteTransaksi(int? id) async =>
      await delete('$url/transaksi/$id',
          headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
}
