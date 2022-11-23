import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_ziswaf/app/data/models/jenisdonasis_model.dart';
import 'package:mobile_ziswaf/app/data/providers/transaksi_provider.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/zakat_model.dart';
import 'package:mobile_ziswaf/app/data/models/bank_model.dart';
import 'package:mobile_ziswaf/app/data/providers/bank_provider.dart';

class ChooseBankController extends GetxController {
  late TextEditingController bankAccountController;
  late TextEditingController nomorResiController;
  late TextEditingController accountNameController;
  late TextEditingController searchBankController;
  late TextEditingController searchDonasiController;
  late TextEditingController searchDonasi2Controller;
  late TextEditingController searchDonasi3Controller;
  late TextEditingController searchDonasi4Controller;
  late TextEditingController nominalController;
  late GlobalKey<FormState> loginFormKey;
  late ScrollController firstController;
  late ScrollController firstController2;
  late ScrollController firstController3;
  late TextEditingController nominal2Controller;
  late TextEditingController nominal3Controller;
  late TextEditingController nominal4Controller;

  RxList<Zakat> donasis = [
    Zakat(jenisDonasi: 'Zakat Maal'),
    Zakat(jenisDonasi: 'Zakat Penghasilan'),
    Zakat(jenisDonasi: 'Zakat Fitrah'),
    Zakat(jenisDonasi: 'Infaq'),
  ].obs;

  BankProvider bankProvider = BankProvider();
  TransaksiProvider donasiprovider = TransaksiProvider();

  RxList<Bank> banks = <Bank>[].obs;
  RxList<Jenisdonasis> jenisdonasi = <Jenisdonasis>[].obs;
  RxBool alokasi2 = false.obs;
  RxBool alokasi3 = false.obs;
  RxBool alokasi4 = false.obs;

  RxList<Jenisdonasis> jenisdonasionsearch = <Jenisdonasis>[].obs;
  RxList<Bank> banksOnSearch = <Bank>[].obs;
  RxList<Zakat> donasisOnSearch = <Zakat>[].obs;

  RxString selectedBank = ''.obs;
  RxInt selectedBankId = 0.obs;
  RxInt selectedJenisDonasiId = 0.obs;
  RxInt selectedJenisDonasiId2 = 0.obs;
  RxInt selectedJenisDonasiId3 = 0.obs;
  RxInt selectedJenisDonasiId4 = 0.obs;
  RxString selectedDonasi = ''.obs;
  RxBool isSelected = false.obs;
  RxString selectedDonasi2 = ''.obs;
  RxBool isSelected2 = false.obs;
  RxString selectedDonasi3 = ''.obs;
  RxBool isSelected3 = false.obs;
  RxString selectedDonasi4 = ''.obs;
  RxBool isSelected4 = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSelectedBank = false.obs;

  final maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###',
    filter: {"#": RegExp(r'[0123456789]')},
  );

  @override
  void onInit() {
    bankAccountController = TextEditingController();
    accountNameController = TextEditingController();
    nomorResiController = TextEditingController();
    searchBankController = TextEditingController();
    searchDonasiController = TextEditingController();
    searchDonasi2Controller = TextEditingController();
    searchDonasi3Controller = TextEditingController();
    searchDonasi4Controller = TextEditingController();
    nominalController = TextEditingController();
    nominal2Controller = TextEditingController();
    nominal3Controller = TextEditingController();
    nominal4Controller = TextEditingController();
    firstController = ScrollController();
    firstController2 = ScrollController();
    firstController3 = ScrollController();
    loginFormKey = GlobalKey<FormState>();
    getBanks();

    nominalController = TextEditingController(text: '0');
    nominal2Controller = TextEditingController(text: '0');
    nominal3Controller = TextEditingController(text: '0');
    nominal4Controller = TextEditingController(text: '0');
    clearText();
    super.onInit();
  }

  @override
  void onClose() {
    nomorResiController.dispose();
    bankAccountController.dispose();
    accountNameController.dispose();
    searchBankController.dispose();
    searchDonasiController.dispose();
    searchDonasi2Controller.dispose();
    searchDonasi3Controller.dispose();
    searchDonasi4Controller.dispose();
    // nominalController.dispose();
    // selectedDonasi();
    super.onClose();
  }

  void searchBank(String value) {
    banksOnSearch.value = banks.where((element) {
      final loweredBank = element.nama!.toLowerCase();
      return loweredBank.contains(value.toLowerCase());
    }).toList();
  }

  void searchDonasi(String value) {
    jenisdonasionsearch.value = jenisdonasi.where((element) {
      final loweredDonasi = element.nama!.toLowerCase();
      return loweredDonasi.contains(value.toLowerCase());
    }).toList();
  }

  getJenisdonasi({required int id}) async {
    isLoading.value = true;
    jenisdonasi.assignAll(await donasiprovider.getJenisDonasi(id));
    update();
    isLoading.value = false;
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
