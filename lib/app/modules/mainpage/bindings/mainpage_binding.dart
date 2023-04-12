import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:get/get.dart';
import '../controllers/mainpage_controller.dart';

class MainpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainpageController>(
      () => MainpageController(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
  }
}
