import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/bank_model.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController accountNameController;
  late TextEditingController searchBankController;

  RxList<Bank> banks = [
    Bank(bank: "Bank BCA", logo: "assets/logos/BCA.png"),
    Bank(bank: "Bank Mandiri", logo: "assets/logos/mandiri.png"),
    Bank(bank: "Bank BCA", logo: "assets/logos/BCA.png"),
    Bank(bank: "Bank Mandiri", logo: "assets/logos/mandiri.png"),
  ].obs;

  RxList<Bank> banksOnSearch = <Bank>[].obs;

  RxString selectedBank = ''.obs;
  RxBool isSelected = false.obs;

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    searchBankController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    bankAccountController.dispose();
    accountNameController.dispose();
    searchBankController.dispose();
    super.onClose();
  }

  void searchBank(String value) {
    banksOnSearch.value = banks
        .where(
          (element) => element.bank!.contains('mandiri'),
        )
        .toList();
  }
}
