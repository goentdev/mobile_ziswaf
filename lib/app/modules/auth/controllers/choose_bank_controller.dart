import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/bank_model.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/zakat_model.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController accountNameController;
  late TextEditingController searchBankController;
  late TextEditingController searchDonasiController;
  late TextEditingController nominalController;

  RxList<Zakat> donasis = [
    Zakat(jenisDonasi: 'Zakat Maal'),
    Zakat(jenisDonasi: 'Zakat Penghasilan'),
    Zakat(jenisDonasi: 'Zakat Fitrah'),
    Zakat(jenisDonasi: 'Infaq'),
  ].obs;

  RxList<Bank> banks = [
    Bank(bank: "Bank BCA", logo: "assets/logos/BCA.png"),
    Bank(bank: "Bank Mandiri", logo: "assets/logos/mandiri.png"),
    Bank(bank: "Bank BCA", logo: "assets/logos/BCA.png"),
    Bank(bank: "Bank Mandiri", logo: "assets/logos/mandiri.png"),
  ].obs;

  RxList<Bank> banksOnSearch = <Bank>[].obs;
  RxList<Zakat> donasisOnSearch = <Zakat>[].obs;

  RxString selectedBank = ''.obs;
  RxString selectedDonasi = ''.obs;
  RxBool isSelected = false.obs;

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    searchBankController = TextEditingController();
    searchDonasiController = TextEditingController();
    nominalController = TextEditingController();
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
      final loweredBank = element.bank!.toLowerCase();
      return loweredBank.contains(value.toLowerCase());
    }).toList();
  }

  void searchDonasi(String value) {
    donasisOnSearch.value = donasis.where((element) {
      final loweredDonasi = element.jenisDonasi!.toLowerCase();
      return loweredDonasi.contains(value.toLowerCase());
    }).toList();
  }
}
