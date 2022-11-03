import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> registerFormKey;

  RxBool isLoading = false.obs;
  RxBool showPassword = true.obs;
  RxBool showPassword2 = true.obs;
  RxBool showPassword3 = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    registerFormKey = GlobalKey<FormState>();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void changeShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void changeShowPassword2() {
    showPassword2.value = !showPassword2.value;
  }

  void changeShowPassword3() {
    showPassword3.value = !showPassword3.value;
  }
}
