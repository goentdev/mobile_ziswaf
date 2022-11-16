import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/alokasidana_model.dart';
import 'package:mobile_ziswaf/app/data/models/muzaki_model.dart';
import 'package:mobile_ziswaf/app/data/models/program_model.dart';
import 'package:mobile_ziswaf/app/data/models/total_selesai_berlangsung_model.dart';
import 'package:mobile_ziswaf/app/data/models/totaldanaprogram_model.dart';
import 'package:mobile_ziswaf/app/data/models/totaltransaksi_model.dart';
import 'package:mobile_ziswaf/app/data/models/transaksi_model.dart';
import 'package:mobile_ziswaf/app/data/providers/program_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/totaldanaprogram_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/totaltransaksi_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/transaksi_provider.dart';
import 'package:path/path.dart';

import '../../../../data/models/user_model.dart';
import '../../../../data/providers/muzaki_provider.dart';

class ProgramPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;

  late ScrollController scrollController;
  late ScrollController scrollController2;
  final count = 0.obs;
  TransaksiProvider transaksiProvider = TransaksiProvider();
  MuzakiProvider muzakiProvider = MuzakiProvider();
  ProgramProvider programProvider = ProgramProvider();
  TotaldanaprogramProvider totalDanaProgramprovider =
      TotaldanaprogramProvider();
  TotaltransaksiProvider totaltransaksiProviderr = TotaltransaksiProvider();

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  RxList<Transaksi>? transaksi = <Transaksi>[].obs;

  Rx<Transaksi> transaksis = Transaksi().obs;
  RxList<Alokasidana>? alokasi = <Alokasidana>[].obs;
  Rx<Alokasidana> alokasidana = Alokasidana().obs;
  RxList<Muzaki>? muzaki = <Muzaki>[].obs;
  Rx<Muzaki> muzakis = Muzaki().obs;
  Rx<Meta?> totalBerlangsung = Meta().obs;
  Rx<Meta?> selesai = Meta().obs;
  Rx<Totaldanaprogram?> totalDana = Totaldanaprogram().obs;
  Rx<Totaltransaksi?> totaltransaksiiD = Totaltransaksi().obs;
  RxList<Program>? program = <Program>[].obs;
  RxList<Program>? programBerlangsung = <Program>[].obs;
  Rx<Program?> program2 = Program().obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    // refreshTransaksi();
    // getTransaksis(id: 39);
    gettotalberlangsungg();
    gettotaldana();
    getPrograms();
    scrollController = ScrollController();
    scrollController2 = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  gettotaldana() async {
    totalDana.value = await totalDanaProgramprovider.totaldanaprogram();
    update();
  }

  totaltransaksi({required int? id}) async {
    totaltransaksiiD.value = await totaltransaksiProviderr.totaltransaksiId(id);
    update();
  }

  getPrograms() async {
    isLoading.value = true;
    program!.assignAll(await programProvider.getProgram());
    update();
    isLoading.value = false;
  }

  gettotalberlangsungg() async {
    totalBerlangsung.value =
        await programProvider.getTotalBerlangsung('berlangsung');
    update();
  }

  gettotalselesai() async {
    selesai.value = await programProvider.getTotalBerlangsung('selesai');
    update();
  }

  deleteTransaksi(int? id) async {
    isLoading.value = true;

    transaksi!.removeWhere((element) => element.id == id);
    await transaksiProvider.deleteTransaksi(id);

    isLoading.value = false;
  }

  getTransaksis({required int? id}) async {
    isLoading.value = true;
    transaksi!.assignAll(await transaksiProvider.getTransaksi(id));
    update();
    isLoading.value = false;
  }

  getAlokasiDana({required int? id}) async {
    isLoading.value = true;
    alokasi!.assignAll(await transaksiProvider.getAlokasiDana(id));
    update();
    isLoading.value = false;
  }

  refreshProgram() async {
    isLoading.value = true;

    program!.assignAll(await programProvider.getProgram());

    isLoading.value = false;
  }

  getMuzakisall({required int? id}) async {
    isLoading.value = true;
    muzaki!.assignAll(await muzakiProvider.getMuzakisall(id));
    update();
    isLoading.value = false;
  }

  Future<bool> changeTransaksi({
    required id,
    required programId,
    required muzakiId,
    required jenisDonasi,
    required nominal,
    required nomorRekening,
    required namaRekening,
    required nomorResi,
    required buktiTransaksi,
    linkfoto,
    required bankId,
  }) async {
    if (buktiTransaksi != null) {
      final fotoRef = firebaseStorage.ref('bukti-transaksi');
      final convertedFoto = File(buktiTransaksi);
      final fotoExt = extension(convertedFoto.path);
      final fireFoto = fotoRef.child('${_getRandomFileName()}.$fotoExt');
      await fireFoto.putFile(File(buktiTransaksi));
      linkfoto = await fireFoto.getDownloadURL();
    } else {
      linkfoto;
    }
    bool sukses = await transaksiProvider.changeTransaksi(id, {
      "program_id": programId,
      "muzaki_id": muzakiId,
      "jenis_donasi": jenisDonasi,
      "nominal": nominal,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
      "nomor_resi": nomorResi,
      "bukti_transaksi": linkfoto,
      "bank_id": bankId
    });
    if (sukses) {
      transaksis.update((val) {
        val!.bankid = bankId;
        val.nomorRekening = nomorRekening;
        val.nomorResi = nomorResi;
        val.namaRekening = namaRekening;
        val.buktiTransaksi = linkfoto;
      });

      return true;
    } else {
      return false;
    }
  }

  // refreshTransaksi() async {
  //   isLoading.value = true;

  //   transaksi!.assignAll(await transaksiProvider.getTransaksi(1));

  //   isLoading.value = false;
  // }

  String _getRandomFileName() =>
      '${DateTime.now().toUtc().toString()}-${Random().nextInt(8999) + 1000}';
}
