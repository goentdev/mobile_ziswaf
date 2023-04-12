import 'package:flutter/cupertino.dart';

import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  late GlobalKey<FormState> loginFormKey;
  final AuthProvider authProvider = AuthProvider();

  RxBool isLoading = false.obs;
  RxBool showPassword = true.obs;

  @override
  void onInit() {
    whatsappC = TextEditingController();
    passwordC = TextEditingController();
    loginFormKey = GlobalKey<FormState>();

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

  Future<bool> login({
    required String whatsapp,
    required String password,
  }) async {
    isLoading.value = true;

    return await authProvider.login(whatsapp: whatsapp, password: password);
  }
}
