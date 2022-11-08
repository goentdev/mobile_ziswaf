import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/totaltransaksi_model.dart';

class TotaltransaksiProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Future<Totaltransaksi?> totaltransaksiId(int? id) async {
    final response = await get(
      '$url/relawan-program/$id',
      headers: {'Authorization': 'bearer ${sharedPrefs.token}'},
    );
    return Totaltransaksi.fromJson(response.body);
  }

  Future<Response<Totaltransaksi>> postTotaltransaksi(
          Totaltransaksi Totaltransaksi) async =>
      await post('Totaltransaksi', Totaltransaksi);
  Future<Response> deleteTotaltransaksi(int id) async =>
      await delete('totaldanaprogram/$id');
}
