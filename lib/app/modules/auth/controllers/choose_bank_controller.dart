import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController accountNameController;

  List<String> banks = ['Bank BCA', 'Bank Mandiri', 'Bank BNI', 'Bank BRI'].obs;
  RxString selectedBank = ''.obs;

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    super.onInit();
  }
}
