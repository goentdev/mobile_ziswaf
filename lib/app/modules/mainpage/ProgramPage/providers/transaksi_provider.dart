import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../zakat_model.dart';

class TransaksiProvider extends GetConnect {
  final String url = 'https://ziswaf-server.smarteschool.net';
  Future<bool> getZakat({
    required programId,
    required muzakiId,
    required jenisDonasi,
    required nominal,
    required nomorRekening,
    required namaRekening,
    required nomorResi,
    required buktiTransaksi,
    required bankId,
  }) async {
    final response = await post('$url/transaksi', {
      "program_id": programId,
      "muzaki_id": muzakiId,
      "jenis_donasi": jenisDonasi,
      "nominal": nominal,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
      "nomor_resi": nomorResi,
      "bukti_transaksi": buktiTransaksi,
      "bank_id": bankId
    }, headers: {
      'Authorization': 'bearer${sharedPrefs.token}'
    });
    if (response.status.isOk) {
      EasyLoading.showSuccess('Berhasil Add Transaksi');
      return true;
    } else {
      return false;
    }
  }

  Future<Response<Zakat>> postZakat(Zakat zakat) async =>
      await post('zakat', zakat);
  Future<Response> deleteZakat(int id) async => await delete('zakat/$id');
}
