import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IdentityController extends GetxController {
  late TextEditingController identityNumberController;
  List<String> identityType = ['KTP', 'SIM', 'PASPOR'].obs;
  RxString selectedType = ''.obs;

  @override
  void onInit() {
    identityNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    identityNumberController.dispose();
    super.onClose();
  }
}
