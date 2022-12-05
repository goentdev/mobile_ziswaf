import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/totaldanaprogram_model.dart';

class TotaldanaprogramProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Dio dio = Dio();

  Future<Totaldanaprogram?> totaldanaprogram() async {
    final response = await dio.get(
      '$url/relawan-program',
      options:
          Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}),
    );
    return Totaldanaprogram.fromJson(response.data);
  }

  Future<void> deleteTotaldanaprogram(int id) async =>
      await delete('totaldanaprogram/$id');
}
