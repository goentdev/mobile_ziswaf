import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/register_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/card_bank.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/views/mainpage_view.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class ChooseBankView extends GetView<ChooseBankController> {
  final String? nomer;
  final String? password;
  final String? nama;
  final String? email;
  final String? noident;
  final String? foto;
  final String? jenisident;

  const ChooseBankView({
    super.key,
    this.jenisident,
    this.nomer,
    this.password,
    this.nama,
    this.email,
    this.noident,
    this.foto,
  });

  @override
  Widget build(BuildContext context) {
    final chooseC = Get.put(ProfileController());
    final chooseCont = Get.put(ChooseBankController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 16,
          ),
        ),
        title: Text(
          'Masukan Rekening Bank',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: chooseCont.loginFormKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bank',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              GetBuilder<ChooseBankController>(
                init: ChooseBankController(),
                builder: (chooseCont) => GestureDetector(
                  child: DropdownButtonFormField(
                    value: chooseCont.selectedBank.value,
                    items: const [],
                    onChanged: (value) {},
                    icon: const Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                    ),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: neutral30),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral30,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: chooseCont.isSelected.value
                          ? chooseCont.selectedBank.value
                          : 'Pilih Bank',
                      hintStyle: textMBold.copyWith(
                        color: chooseCont.isSelected.value
                            ? neutral100
                            : neutral60,
                      ),
                      isDense: true,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            title: Text(
                              'Pilih Bank',
                              style: textMBlack.copyWith(color: neutral90),
                            ),
                            leading: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: neutral90,
                                size: 16,
                              ),
                            ),
                            centerTitle: true,
                          ),
                          body: Obx(
                            () => SingleChildScrollView(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: neutral40,
                                        ),
                                        child: TextField(
                                          controller:
                                              chooseCont.searchBankController,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            prefixIcon: Icon(Icons.search),
                                            hintText: 'Cari',
                                          ),
                                          onChanged: (value) {
                                            chooseCont.searchBank(value);
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Scrollbar(
                                        thumbVisibility: true,
                                        controller: chooseCont.firstController2,
                                        child: ListView.builder(
                                          controller:
                                              chooseCont.firstController2,
                                          shrinkWrap: true,
                                          itemCount: chooseCont
                                                  .searchBankController
                                                  .text
                                                  .isNotEmpty
                                              ? chooseCont.banksOnSearch.length
                                              : chooseCont.banks.length,
                                          itemBuilder: (context, index) {
                                            if (chooseCont.searchBankController
                                                .text.isNotEmpty) {
                                              return CardBank(
                                                bank: chooseCont
                                                    .banksOnSearch[index].nama!,
                                                gambar: chooseCont
                                                    .banksOnSearch[index]
                                                    .image!,
                                                onTap: () {
                                                  chooseCont
                                                          .selectedBank.value =
                                                      chooseCont
                                                          .banksOnSearch[index]
                                                          .nama!;
                                                  chooseCont.selectedBankId
                                                          .value =
                                                      chooseCont
                                                          .banksOnSearch[index]
                                                          .id!;
                                                  chooseCont.isSelected.value =
                                                      true;
                                                  chooseCont.update();
                                                  Get.back();
                                                },
                                                id: chooseCont
                                                    .banksOnSearch[index].id!,
                                              );
                                            } else {
                                              return CardBank(
                                                bank: chooseCont
                                                    .banks[index].nama!,
                                                gambar: chooseCont
                                                    .banks[index].image!,
                                                onTap: () {
                                                  chooseCont.update();
                                                  chooseCont
                                                          .selectedBank.value =
                                                      chooseCont
                                                          .banks[index].nama!;
                                                  chooseCont.selectedBankId
                                                          .value =
                                                      chooseCont
                                                          .banks[index].id!;
                                                  chooseCont.isSelected.value =
                                                      true;
                                                  Get.back();
                                                },
                                                id: chooseCont.banks[index].id!,
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nomor Rekening',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: chooseCont.bankAccountController,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Nomor Rekening Tidak boleh Kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: neutral30,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: 'Masukkan Nomor Rekening',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rekening Atas Nama',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: chooseCont.accountNameController,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Nama Rekening Tidak boleh Kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: neutral30,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: 'Masukkan Nama Rekening',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  isDense: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => chooseC.isLoading2.value
                ? const LoadingButton()
                : SizedBox(
                    height: 41,
                    width: 343,
                    child: FloatingActionButton.extended(
                      backgroundColor: primaryMain,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      onPressed: () async {
                        if (chooseCont.loginFormKey.currentState!.validate() &&
                            chooseCont.selectedBank.value != '') {
                          bool sukses = await chooseC.changeBank(
                              nomorRekening:
                                  chooseCont.bankAccountController.text,
                              namaRekening:
                                  chooseCont.accountNameController.text,
                              bankId: chooseCont.selectedBankId.value);

                          if (sukses) {
                            chooseCont.isLoading.value = false;
                            EasyLoading.showSuccess('Daftar Berhasil');
                            chooseCont.update();
                            chooseCont.isLoading.value = false;
                            Get.offAllNamed(Routes.MAINPAGE);
                          } else {
                            chooseCont.isLoading.value = false;
                          }
                        }
                      },
                      label: Text(
                        'Selanjutnya',
                        style: buttonTabsTextBold.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
