import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/tambah_transaksi_page.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';
import 'package:path/path.dart';

import '../zakat_model.dart';

class TransaksiProvider extends GetConnect {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final String url = 'https://ziswaf-server.smarteschool.net';
  String? linkBuktiTransaksi;
  String _getRandomFileName() =>
      '${DateTime.now().toUtc().toString()}-${Random().nextInt(8999) + 1000}';
  Future<bool> tambahTransaksi({
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
    final fotoRef = firebaseStorage.ref('bukti-transaksi');
    final convertedFoto = File(buktiTransaksi);
    final fotoExt = extension(convertedFoto.path);
    final fireFoto = fotoRef.child('${_getRandomFileName()}.$fotoExt');
    await fireFoto.putFile(File(buktiTransaksi));
    linkBuktiTransaksi = await fireFoto.getDownloadURL();
    final response = await post('$url/transaksi', {
      "program_id": programId,
      "muzaki_id": muzakiId,
      "jenis_donasi": jenisDonasi,
      "nominal": nominal,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
      "nomor_resi": nomorResi,
      "bukti_transaksi": linkBuktiTransaksi,
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
