import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TambahUbahMuzakkiController extends GetxController {
  late TextEditingController namemuzakkiController;
  late TextEditingController whatsappmuzakkiController;
  late TextEditingController emailmuzakkiController;
  late TextEditingController kategorimuzakkiController;
  late TextEditingController tipemuzakiController;
  List<String> kategorimuzakki = ['Personal', 'Badan Usaha', 'Pemerintah'].obs;
  List<String> tipemuzakki = ['Harian', 'Bulanan', 'Waktu Tertentu'].obs;
  RxString selectedType = ''.obs;
  RxString selected = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    kategorimuzakkiController = TextEditingController();
    tipemuzakiController = TextEditingController();
    namemuzakkiController = TextEditingController();
    whatsappmuzakkiController = TextEditingController();
    emailmuzakkiController = TextEditingController();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    kategorimuzakkiController.dispose();
    tipemuzakiController.dispose();
    namemuzakkiController.dispose();
    whatsappmuzakkiController.dispose();
    emailmuzakkiController.dispose();
    update();
    super.onClose();
  }
}
