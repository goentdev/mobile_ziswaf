import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  late TextEditingController confirmC;

  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

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

  // void printControllerText() {
  //   print(whatsappC.text);
  //   print(passwordC.text);
  // }
}
