import 'package:get/get.dart';

import '../../utils/shared_preferences.dart';
import '../models/muzaki_model.dart';

class MuzakiProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Future<List<Muzaki>> getMuzakis(int? id) async {
    final response = await get('$url/muzaki?user_id=$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    print(response.body);
    if (response.statusCode == 200) {
      var data = response.body['muzaki']['muzaki']['data'];
      List<Muzaki> muzaki = [];
      data.forEach((e) => {muzaki.add(Muzaki.fromJson(e))});
      return muzaki;
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<Muzaki?> getMuzaki(int? id) async {
    final response = await get('muzaki?user_id=$id',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    return response.body;
  }

  Future<Response<Muzaki>> postMuzaki(Muzaki muzaki) async =>
      await post('muzaki', muzaki);
  Future<Response> deleteMuzaki(int id) async => await delete('muzaki/$id');
}
