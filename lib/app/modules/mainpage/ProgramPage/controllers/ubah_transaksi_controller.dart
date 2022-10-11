import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/user_model.dart';

class UbahTransakiController extends GetxController {
  late TextEditingController searchMuzakkiController;

  @override
  void onInit() {
    searchMuzakkiController = TextEditingController();
    super.onInit();
  }

  RxList<User> users = [
    User(nama: "Alif Pramana Putra", nomor: "082112344321"),
    User(nama: "Rochim Ramadhani", nomor: "0813161194111"),
    User(nama: "Iqbal Baskoro", nomor: "0827161319902"),
    User(nama: "Maher Zain", nomor: "0827161319900"),
    User(nama: "Aldava Ramanda", nomor: "0857698812321"),
  ].obs;

  RxList<User> muzakkisOnSearch = <User>[].obs;

  void searchMuzakki(String value) {
    muzakkisOnSearch.value = users.where((element) {
      final loweredNama = element.nama!.toLowerCase();
      return loweredNama.contains(value.toLowerCase());
    }).toList();
  }
}
