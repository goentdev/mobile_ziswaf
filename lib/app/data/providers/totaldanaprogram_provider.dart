import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/totaldanaprogram_model.dart';

class TotaldanaprogramProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';

  Future<Totaldanaprogram?> totaldanaprogram() async {
    final response = await get(
      '$url/relawan-program',
      headers: {'Authorization': 'bearer ${sharedPrefs.token}'},
    );
    return Totaldanaprogram.fromJson(response.body);
  }

  Future<Response<Totaldanaprogram>> postTotaldanaprogram(
          Totaldanaprogram totaldanaprogram) async =>
      await post('totaldanaprogram', totaldanaprogram);
  Future<Response> deleteTotaldanaprogram(int id) async =>
      await delete('totaldanaprogram/$id');
}
