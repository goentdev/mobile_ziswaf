import 'package:get/get.dart';
import '../../utils/shared_preferences.dart';
import '../models/totaltransaksi_model.dart';

class TotaltransaksiProvider extends GetConnect {
  final String url = 'https://server.yayasanyamini.com';

  Future<Totaltransaksi?> totaltransaksiId(int? id) async {
    final response = await get('$url/relawan-program/$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    return Totaltransaksi.fromJson(response.body);
  }

  Future<void> deleteTotaltransaksi(int id) async =>
      await delete('totaldanaprogram/$id');
}
