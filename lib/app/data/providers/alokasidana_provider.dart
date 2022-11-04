import 'package:get/get.dart';

import '../models/alokasidana_model.dart';

class AlokasidanaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Alokasidana.fromJson(map);
      if (map is List)
        return map.map((item) => Alokasidana.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Alokasidana?> getAlokasidana(int id) async {
    final response = await get('alokasidana/$id');
    return response.body;
  }

  Future<Response<Alokasidana>> postAlokasidana(
          Alokasidana alokasidana) async =>
      await post('alokasidana', alokasidana);
  Future<Response> deleteAlokasidana(int id) async =>
      await delete('alokasidana/$id');
}
