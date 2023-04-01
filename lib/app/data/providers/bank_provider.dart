import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/bank_yayasan_model.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../models/bank_model.dart';

class BankProvider extends GetConnect {
  String url = 'https://server.yayasanyamini.com';

  Dio dio = Dio();

  Future<List<Bank>> getBanks() async {
    final response = await dio.get('$url/bank',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));

    List<dynamic> data = response.data;
    return data.map((e) => Bank.fromJson(e)).toList();
  }

  Future<List<BankYayasan>> getbankyayasan() async {
    final response = await dio.get(
      '$url/rekening-yayasan',
    );
    List<dynamic> data = response.data;
    return data.map((e) => BankYayasan.fromJson(e)).toList();
  }
}
