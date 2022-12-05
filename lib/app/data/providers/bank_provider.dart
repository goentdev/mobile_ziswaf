import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/bank_model.dart';

class BankProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Dio dio = Dio();

  Future<List<Bank>> getBanks() async {
    final response = await dio.get('$url/bank',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));

    List<dynamic> data = response.data;
    return data.map((e) => Bank.fromJson(e)).toList();
  }
}
