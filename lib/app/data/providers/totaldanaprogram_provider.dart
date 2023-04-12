import 'package:get/get.dart';
import '../../utils/shared_preferences.dart';
import '../models/totaldanaprogram_model.dart';

class TotaldanaprogramProvider extends GetConnect {
  final String url = 'https://server.yayasanyamini.com';

  Future<Totaldanaprogram?> totaldanaprogram() async {
    final response = await get('$url/relawan-program',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    return Totaldanaprogram.fromJson(response.body);
  }

  Future<void> deleteTotaldanaprogram(int id) async =>
      await delete('totaldanaprogram/$id');
}
