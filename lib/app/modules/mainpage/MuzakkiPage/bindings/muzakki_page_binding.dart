import 'package:get/get.dart';

import '../controllers/muzakki_page_controller.dart';

class MuzakkiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MuzakkiPageController>(
      () => MuzakkiPageController(),
    );
  }
}
