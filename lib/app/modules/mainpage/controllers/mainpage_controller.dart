import 'package:get/get.dart';

class MainpageController extends GetxController {
  var currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
