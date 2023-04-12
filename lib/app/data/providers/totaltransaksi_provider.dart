import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/totaltransaksi_model.dart';

class TotaltransaksiProvider extends GetConnect {
  final String url = 'https://server.yayasanyamini.com';
  Dio dio = Dio();

  Future<Totaltransaksi?> totaltransaksiId(int? id) async {
    final response = await dio.get(
      '$url/relawan-program/$id',
      options:
          Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}),
    );
    return Totaltransaksi.fromJson(response.data);
  }

  Future<void> deleteTotaltransaksi(int id) async =>
      await delete('totaldanaprogram/$id');
}
