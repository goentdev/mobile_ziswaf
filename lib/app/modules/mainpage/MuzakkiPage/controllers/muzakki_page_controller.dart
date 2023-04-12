import 'package:flutter/material.dart';

import 'package:mobile_ziswaf/app/data/models/muzaki_model.dart';
import 'package:mobile_ziswaf/app/data/models/totalmuzaki_model.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/muzaki_provider.dart';
import 'package:get/get.dart';
import '../../../../data/providers/user_provider.dart';

class MuzakkiPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TextEditingController searchMuzakkiController;
  late TextEditingController searchMuzakkiController2;
  late TextEditingController searchMuzakkiController3;
  late TabController tabController;
  late ScrollController scrollController;

  MuzakiProvider muzakiProvider = MuzakiProvider();

  Rx<User?> user = User().obs;
  RxBool isSelected = false.obs;
  UserProvider userProvider = UserProvider();

  RxList<Muzaki>? muzaki = <Muzaki>[].obs;
  RxList<Muzaki>? muzakipersonal = <Muzaki>[].obs;
  RxList<Muzaki>? muzakibadanusaha = <Muzaki>[].obs;
  RxList<Muzaki>? muzakipemerintah = <Muzaki>[].obs;
  Rx<Totalmuzaki?> totalmuzaki = Totalmuzaki().obs;

  Rx<Muzaki>? muzakis = Muzaki().obs;

  RxList<Muzaki>? muzakkisOnSearchPersonal = <Muzaki>[].obs;
  RxList<Muzaki>? muzakkisOnSearchBadanUsaha = <Muzaki>[].obs;
  RxList<Muzaki>? muzakkisOnSearchPemerintah = <Muzaki>[].obs;
  RxList<Muzaki>? muzakkisOnSearch = <Muzaki>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  @override
  void onInit() {
    searchMuzakkiController2 = TextEditingController();
    searchMuzakkiController = TextEditingController();
    searchMuzakkiController3 = TextEditingController();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    gettotalmuzaki();
    getMuzakis();
    getMuzakisall();
    refreshMuzaki();
    scrollController = ScrollController();

    super.onInit();
  }

  @override
  void onClose() {
    // searchMuzakkiController.dispose();
    // searchMuzakkiController3.dispose();
    // searchMuzakkiController2.dispose();
    tabController.dispose();
    super.onClose();
  }

  getMuzakisall() async {
    isLoading.value = true;
    muzaki!.assignAll(await muzakiProvider.getMuzakisall(1));
    update();
    isLoading.value = false;
  }

  gettotalmuzaki() async {
    totalmuzaki.value = await muzakiProvider.getTotalMuzakis(1);
    update();
  }

  getMuzakis() async {
    isLoading.value = true;
    muzakipersonal!.assignAll(await muzakiProvider.getMuzakis('personal'));
    muzakipemerintah!.assignAll(await muzakiProvider.getMuzakis('pemerintah'));
    muzakibadanusaha!.assignAll(await muzakiProvider.getMuzakis('badan usaha'));
    update();
    isLoading.value = false;
  }

  Future<bool> changeMuzaki({
    required int id,
    required String nama,
    required String whatsapp,
    required String email,
    required String kategori,
    required String tipe,
  }) async {
    bool success = await muzakiProvider.changeMuzaki(id, {
      "nama": nama,
      "email": email,
      "whatsapp": whatsapp,
      "kategori": kategori,
      "tipe": tipe,
    });
    if (success) {
      muzakis!.update((val) {
        val!.nama = nama;
        val.kategori = kategori;
        val.tipe = tipe;
      });
      return true;
    } else {
      return false;
    }
  }

  deleteMuzaki(int id) async {
    isLoading.value = true;

    muzaki!.removeWhere((element) => element.id == id);
    await muzakiProvider.deleteMuzaki(id);

    isLoading.value = false;
  }

  refreshMuzaki() async {
    isLoading.value = true;

    muzakipersonal!.assignAll(await muzakiProvider.getMuzakis('personal'));
    muzakipemerintah!.assignAll(await muzakiProvider.getMuzakis('pemerintah'));
    muzakibadanusaha!.assignAll(await muzakiProvider.getMuzakis('badan usaha'));
    totalmuzaki.value = await muzakiProvider.getTotalMuzakis(1);
    muzaki!.assignAll(await muzakiProvider.getMuzakisall(1));

    isLoading.value = false;
  }

  refreshMuzaki2() async {
    muzakipersonal!.assignAll(await muzakiProvider.getMuzakis('personal'));
    muzakipemerintah!.assignAll(await muzakiProvider.getMuzakis('pemerintah'));
    muzakibadanusaha!.assignAll(await muzakiProvider.getMuzakis('badan usaha'));
    totalmuzaki.value = await muzakiProvider.getTotalMuzakis(1);
    muzaki!.assignAll(await muzakiProvider.getMuzakisall(1));
  }

  void searchMuzakki(String value) {
    muzakkisOnSearchPemerintah!.value = muzakipemerintah!.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    muzakkisOnSearchPersonal!.value = muzakipersonal!.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    muzakkisOnSearchBadanUsaha!.value = muzakibadanusaha!.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    update();
    muzakkisOnSearch!.value = muzaki!.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    update();
  }
}
