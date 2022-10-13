import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/bank_model.dart';
import 'package:mobile_ziswaf/app/data/providers/bank_provider.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController accountNameController;
  late TextEditingController searchBankController;
  BankProvider bankProvider = BankProvider();

  RxList<Bank> banks = <Bank>[].obs;

  RxList<Bank> banksOnSearch = <Bank>[].obs;

  RxString selectedBank = ''.obs;
  RxBool isSelected = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    searchBankController = TextEditingController();
    getBanks();
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
    banksOnSearch.value = banks.where((element) {
      final loweredBank = element.nama!.toLowerCase();
      return loweredBank.contains(value.toLowerCase());
    }).toList();
  }

  getBanks() async {
    isLoading.value = true;

    banks.assignAll(await bankProvider.getBanks());

    isLoading.value = false;
  }
}
