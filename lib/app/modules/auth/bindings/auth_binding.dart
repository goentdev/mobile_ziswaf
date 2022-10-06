import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/form_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/register_controller.dart';

import '../controllers/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<FormController>(
      () => FormController(),
    );
    Get.lazyPut<IdentityController>(
      () => IdentityController(),
    );
    Get.lazyPut<ChooseBankController>(
      () => ChooseBankController(),
    );
  }
}
