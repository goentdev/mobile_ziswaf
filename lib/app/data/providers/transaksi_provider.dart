import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/transaksi_model.dart';

class TransaksiProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Future<List<Transaksi>> getTransaksi(int? id) async {
    final response = await get('$url/relawan-program/$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    print(response.body);
    if (response.statusCode == 200) {
      var data = response.body['transaksi']['data'];
      List<Transaksi> transaksi = [];
      data.forEach((e) => {transaksi.add(Transaksi.fromJson(e))});
      return transaksi;
    } else {
      throw EasyLoading.showError('Server Error! Coba lagi nanti');
    }
  }

  Future<Response<Transaksi>> postTransaksi(Transaksi transaksi) async =>
      await post('transaksi', transaksi);
  Future<Response> deleteTransaksi(int id) async =>
      await delete('transaksi/$id');
}
