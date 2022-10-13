import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/bank_model.dart';

class BankProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Future<List<Bank>> getBanks() async {
    final response = await get('$url/bank',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});

    List<dynamic> data = response.body;
    return data.map((e) => Bank.fromJson(e)).toList();
  }
}
