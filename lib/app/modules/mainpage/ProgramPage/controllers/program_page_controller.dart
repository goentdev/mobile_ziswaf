import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/alokasidana_model.dart';
import 'package:mobile_ziswaf/app/data/models/muzaki_model.dart';
import 'package:mobile_ziswaf/app/data/models/program_model.dart';
import 'package:mobile_ziswaf/app/data/models/totaldanaprogram_model.dart';
import 'package:mobile_ziswaf/app/data/models/totaltransaksi_model.dart';
import 'package:mobile_ziswaf/app/data/models/transaksi_model.dart';
import 'package:mobile_ziswaf/app/data/providers/program_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/totaldanaprogram_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/totaltransaksi_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/transaksi_provider.dart';

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

  RxList<Transaksi>? transaksi = <Transaksi>[].obs;
  RxList<Alokasidana>? alokasi = <Alokasidana>[].obs;
  RxList<Muzaki>? muzaki = <Muzaki>[].obs;
  Rx<Muzaki> muzakis = Muzaki().obs;
  Rx<Totaldanaprogram?> totalDana = Totaldanaprogram().obs;
  Rx<Totaltransaksi?> totaltransaksiiD = Totaltransaksi().obs;
  RxList<Program>? program = <Program>[].obs;
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

  // refreshTransaksi() async {
  //   isLoading.value = true;

  //   transaksi!.assignAll(await transaksiProvider.getTransaksi(1));

  //   isLoading.value = false;
  // }
}
