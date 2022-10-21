import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/zakat_model.dart';
import 'package:mobile_ziswaf/app/data/models/bank_model.dart';
import 'package:mobile_ziswaf/app/data/providers/bank_provider.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController accountNameController;
  late TextEditingController searchBankController;
  late TextEditingController searchDonasiController;
  late TextEditingController nominalController;
  late ScrollController firstController;
  late ScrollController firstController2;
  // late TextEditingController nominal2Controller;
  // late TextEditingController nominal3Controller;
  // late TextEditingController nominal4Controller;

  RxList<Zakat> donasis = [
    Zakat(jenisDonasi: 'Zakat Maal'),
    Zakat(jenisDonasi: 'Zakat Penghasilan'),
    Zakat(jenisDonasi: 'Zakat Fitrah'),
    Zakat(jenisDonasi: 'Infaq'),
  ].obs;

  BankProvider bankProvider = BankProvider();

  RxList<Bank> banks = <Bank>[].obs;
  RxBool alokasi2 = false.obs;
  RxBool alokasi3 = false.obs;
  RxBool alokasi4 = false.obs;

  RxList<Bank> banksOnSearch = <Bank>[].obs;
  RxList<Zakat> donasisOnSearch = <Zakat>[].obs;

  RxString selectedBank = ''.obs;
  RxString selectedDonasi = ''.obs;
  RxBool isSelected = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    searchBankController = TextEditingController();
    searchDonasiController = TextEditingController();
    nominalController = TextEditingController();
    firstController = ScrollController();
    firstController2 = ScrollController();
    getBanks();
    nominalController = TextEditingController(text: '0');
    // nominal2Controller = TextEditingController(text: '0');
    // nominal3Controller = TextEditingController(text: '0');
    // nominal4Controller = TextEditingController(text: '0');
    clearText();
    super.onInit();
  }

  @override
  void onClose() {
    bankAccountController.dispose();
    accountNameController.dispose();
    searchBankController.dispose();
    searchDonasiController.dispose();
    nominalController.dispose();
    super.onClose();
  }

  void searchBank(String value) {
    banksOnSearch.value = banks.where((element) {
      final loweredBank = element.nama!.toLowerCase();
      return loweredBank.contains(value.toLowerCase());
    }).toList();
  }

  void searchDonasi(String value) {
    donasisOnSearch.value = donasis.where((element) {
      final loweredDonasi = element.jenisDonasi!.toLowerCase();
      return loweredDonasi.contains(value.toLowerCase());
    }).toList();
  }

  getBanks() async {
    isLoading.value = true;

    banks.assignAll(await bankProvider.getBanks());

    isLoading.value = false;
  }

  void clearText() {
    update();
  }

  void addAlokasi2() {
    alokasi2.value = !alokasi2.value;
  }

  void addAlokasi3() {
    alokasi3.value = !alokasi3.value;
  }

  void addAlokasi4() {
    alokasi4.value = !alokasi4.value;
  }
}
