import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/muzaki_model.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/muzaki_provider.dart';

import '../../../../data/providers/user_provider.dart';

class MuzakkiPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TextEditingController searchMuzakkiController;
  late TabController tabController;
  late ScrollController scrollController;

  MuzakiProvider muzakiProvider = MuzakiProvider();

  Rx<User?> user = User().obs;

  UserProvider userProvider = UserProvider();

  RxList<Muzaki>? muzaki = <Muzaki>[].obs;

  Rx<Muzaki>? muzakis = Muzaki().obs;

  RxList<Muzaki>? muzakkisOnSearch = <Muzaki>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  @override
  void onInit() {
    searchMuzakkiController = TextEditingController();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    getMuzakis();
    refreshMuzaki();
    scrollController = ScrollController();

    super.onInit();
  }

  @override
  void onClose() {
    searchMuzakkiController.dispose();
    tabController.dispose();
    super.onClose();
  }

  getMuzakis() async {
    isLoading.value = true;
    muzaki!.assignAll(await muzakiProvider.getMuzakis(1));
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

    muzaki!.assignAll(await muzakiProvider.getMuzakis(1));

    isLoading.value = false;
  }

  void searchMuzakki(String value) {
    muzakkisOnSearch!.value = muzaki!.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    update();
  }
}
