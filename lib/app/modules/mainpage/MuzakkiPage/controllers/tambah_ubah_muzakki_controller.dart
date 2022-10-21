import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TambahUbahMuzakkiController extends GetxController {
  late TextEditingController kategorimuzakkiController;
  late TextEditingController tipemuzakiController;
  List<String> kategorimuzakki = ['Personal', 'Badan Usaha', 'Pemerintah'].obs;
  List<String> tipemuzakki = ['Harian', 'Bulanan', 'Waktu Tertentu'].obs;
  RxString selectedType = ''.obs;
  RxString selected = ''.obs;

  @override
  void onInit() {
    kategorimuzakkiController = TextEditingController();
    tipemuzakiController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    kategorimuzakkiController.dispose();
    tipemuzakiController.dispose();
    super.onClose();
  }
}
