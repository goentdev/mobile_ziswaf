import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/bank_yayasan_model.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/bank_model.dart';

class BankProvider extends GetConnect {
  String url = 'https://server.yayasanyamini.com';

  Future<List<Bank>> getBanks() async {
    final response = await get('$url/bank',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    List<dynamic> data = response.body;
    return data.map((e) => Bank.fromJson(e)).toList();
  }

  Future<List<BankYayasan>> getbankyayasan() async {
    final response = await get(
      '$url/rekening-yayasan',
    );
    List<dynamic> data = response.body;
    return data.map((e) => BankYayasan.fromJson(e)).toList();
  }
}
