import 'package:get/get.dart';

import '../models/transaksi_model.dart';

class TransaksiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Transaksi.fromJson(map);
      if (map is List)
        return map.map((item) => Transaksi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Transaksi?> getTransaksi(int id) async {
    final response = await get('transaksi/$id');
    return response.body;
  }

  Future<Response<Transaksi>> postTransaksi(Transaksi transaksi) async =>
      await post('transaksi', transaksi);
  Future<Response> deleteTransaksi(int id) async =>
      await delete('transaksi/$id');
}
