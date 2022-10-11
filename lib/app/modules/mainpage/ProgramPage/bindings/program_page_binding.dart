import 'package:get/get.dart';

import '../controllers/program_page_controller.dart';
import '../controllers/ubah_transaksi_controller.dart';

class ProgramPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramPageController>(
      () => ProgramPageController(),
    );
    Get.lazyPut<UbahTransakiController>(
      () => UbahTransakiController(),
    );
  }
}
