import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  List<String> kategoriTipe = ['Perorangan', 'Lembaga'].obs;
  RxString selectedType = ''.obs;
  RxBool isLoading = false.obs;
  late GlobalKey<FormState> formglobalkey;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    formglobalkey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
