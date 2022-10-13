import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ProgramPage/user_model.dart';

class MuzakkiPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TextEditingController searchMuzakkiController;
  late TabController tabController;

  RxList<User> users = [
    User(nama: "Alif Pramana Putra", nomor: "082112344321"),
    User(nama: "Rochim Ramadhani", nomor: "0813161194111"),
    User(nama: "Iqbal Baskoro", nomor: "0827161319902"),
    User(nama: "Maher Zain", nomor: "0827161319900"),
    User(nama: "Aldava Ramanda", nomor: "0857698812321"),
  ].obs;

  RxList<User> muzakkisOnSearch = <User>[].obs;

  @override
  void onInit() {
    searchMuzakkiController = TextEditingController();
    tabController = TabController(
      length: 3,
      vsync: this,
    );

    super.onInit();
  }

  @override
  void onClose() {
    searchMuzakkiController.dispose();
    tabController.dispose();
    super.onClose();
  }

  void searchMuzakki(String value) {
    muzakkisOnSearch.value = users.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
    update();
  }
}
