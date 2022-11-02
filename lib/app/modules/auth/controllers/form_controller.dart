import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  List<String> kategoriTipe = ['Perorangan', 'Lembaga'].obs;
  RxString selectedType = ''.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
