import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  final loginFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool showPassword = true.obs;

  @override
  void onInit() {
    whatsappC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    whatsappC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  void changeShowPassword() {
    showPassword.value = !showPassword.value;
  }
}
