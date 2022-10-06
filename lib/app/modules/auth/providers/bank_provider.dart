import 'package:get/get.dart';

import '../bank_model.dart';

class BankProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Bank.fromJson(map);
      if (map is List) return map.map((item) => Bank.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Bank?> getBank(int id) async {
    final response = await get('bank/$id');
    return response.body;
  }

  Future<Response<Bank>> postBank(Bank bank) async => await post('bank', bank);
  Future<Response> deleteBank(int id) async => await delete('bank/$id');
}
