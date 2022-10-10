import 'package:get/get.dart';

import '../controllers/program_page_controller.dart';

class ProgramPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramPageController>(
      () => ProgramPageController(),
    );
  }
}
