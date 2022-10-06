import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  late TextEditingController confirmC;

  final registerFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool showPassword = true.obs;

  @override
  void onInit() {
    whatsappC = TextEditingController();
    passwordC = TextEditingController();
    confirmC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    whatsappC.dispose();
    passwordC.dispose();
    confirmC.dispose();
    super.onClose();
  }

  void changeShowPassword() {
    showPassword.value = !showPassword.value;
  }
}
