import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/card_bank.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class ChangeBankPage extends StatelessWidget {
  const ChangeBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseBankController());
    final profileC = Get.put(ProfileController());
    controller.selectedBankId.value = profileC.user.value!.bank!.id!;
    controller.accountNameController.text = profileC.user.value!.namaRekening!;
    controller.bankAccountController.text =
        profileC.user.value!.nomorRekening!.toString();
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
            size: 10,
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
            Obx(
              () => GestureDetector(
                child: DropdownButtonFormField<String>(
                  value: profileC.user.value!.bank!.nama!,
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
                    hintText: controller.isSelected.value
                        ? controller.selectedBank.value
                        : profileC.user.value!.bank!.nama!,
                    hintStyle: textMBold.copyWith(
                      color:
                          controller.isSelected.value ? neutral100 : neutral100,
                    ),
                    isDense: true,
                  ),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 1.0,
                        child: Scaffold(
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
                                              controller.searchBankController,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            prefixIcon: Icon(Icons.search),
                                            hintText: 'Cari',
                                          ),
                                          onChanged: (value) {
                                            controller.searchBank(value);
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      controller.isLoading.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : controller.banks.isNotEmpty
                                              ? Scrollbar(
                                                  thumbVisibility: true,
                                                  controller: controller
                                                      .firstController3,
                                                  child: ListView.builder(
                                                    controller: controller
                                                        .firstController3,
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                            .searchBankController
                                                            .text
                                                            .isNotEmpty
                                                        ? controller
                                                            .banksOnSearch
                                                            .length
                                                        : controller
                                                            .banks.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (controller
                                                          .searchBankController
                                                          .text
                                                          .isNotEmpty) {
                                                        return CardBank(
                                                          bank: controller
                                                              .banksOnSearch[
                                                                  index]
                                                              .nama!,
                                                          gambar: controller
                                                              .banksOnSearch[
                                                                  index]
                                                              .image!,
                                                          onTap: () {
                                                            controller
                                                                    .selectedBank
                                                                    .value =
                                                                controller
                                                                    .banksOnSearch[
                                                                        index]
                                                                    .nama!;
                                                            controller
                                                                    .selectedBankId
                                                                    .value =
                                                                controller
                                                                    .banksOnSearch[
                                                                        index]
                                                                    .id!;
                                                            controller
                                                                .isSelected
                                                                .value = true;
                                                            Get.back();
                                                          },
                                                          id: controller
                                                              .banksOnSearch[
                                                                  index]
                                                              .id!,
                                                        );
                                                      } else {
                                                        return CardBank(
                                                          bank: controller
                                                              .banks[index]
                                                              .nama!,
                                                          gambar: controller
                                                              .banks[index]
                                                              .image!,
                                                          onTap: () {
                                                            controller
                                                                    .selectedBank
                                                                    .value =
                                                                controller
                                                                    .banks[
                                                                        index]
                                                                    .nama!;
                                                            controller
                                                                    .selectedBankId
                                                                    .value =
                                                                controller
                                                                    .banks[
                                                                        index]
                                                                    .id!;
                                                            controller
                                                                .isSelected
                                                                .value = true;
                                                            Get.back();
                                                          },
                                                          id: controller
                                                              .banks[index].id!,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                )
                                              : const Center(
                                                  child:
                                                      Text('Belum ada bank')),
                                    ],
                                  ),
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
              controller: controller.bankAccountController,
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
              controller: controller.accountNameController,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => profileC.isLoading.value
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
                        // ignore: unnecessary_null_comparison
                        if (controller.selectedBankId.value !=
                            profileC.user.value!.bank!.id!) {
                          bool success = await profileC.changeBank(
                              bankId: controller.selectedBankId.value,
                              nomorRekening:
                                  controller.bankAccountController.text,
                              namaRekening:
                                  controller.accountNameController.text);
                          profileC.getProfile();
                          if (success) {
                            profileC.isLoading.value = false;
                            profileC.update();
                            Get.back();
                          } else {
                            profileC.isLoading.value = false;
                          }
                        } else {
                          bool success = await profileC.changeBank(
                              bankId: profileC.user.value!.bank!.id!,
                              nomorRekening:
                                  controller.bankAccountController.text,
                              namaRekening:
                                  controller.accountNameController.text);
                          profileC.getProfile();
                          if (success) {
                            profileC.isLoading.value = false;
                            profileC.update();
                            Get.back();
                          } else {
                            profileC.isLoading.value = false;
                          }
                        }
                      },
                      label: Text(
                        'Simpan',
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
