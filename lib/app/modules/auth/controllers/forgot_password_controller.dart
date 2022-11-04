import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';

class ForgotPasswordController extends GetxController {
  late TextEditingController emailforgot;
  UserProvider userProvider = UserProvider();
  late GlobalKey<FormState> forgotFormKey;

  RxBool isLoading = false.obs;

  void onInit() {
    emailforgot = TextEditingController();
    forgotFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  void onClose() {
    emailforgot.dispose();
    super.onClose();
  }

  Future<bool> forgotpass({required String email}) async {
    isLoading.value = true;
    return await userProvider.forgotpassword(
      email: email,
    );
  }
}
