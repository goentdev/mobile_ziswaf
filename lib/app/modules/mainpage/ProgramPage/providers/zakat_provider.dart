import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../zakat_model.dart';

class ZakatProvider extends GetConnect {
  Dio dio = Dio();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Zakat.fromJson(map);
      if (map is List) return map.map((item) => Zakat.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Zakat?> getZakat(int id) async {
    final response = await dio.get('zakat/$id');
    return response.data;
  }

  Future<void> deleteZakat(int id) async => await delete('zakat/$id');
}
