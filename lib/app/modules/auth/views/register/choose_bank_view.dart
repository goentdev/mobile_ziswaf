import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/card_bank.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class ChooseBankView extends GetView<ChooseBankController> {
  const ChooseBankView({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: DropdownButtonFormField(
                  value: controller.selectedBank.value,
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
                        : 'Pilih Bank',
                    hintStyle: textMBold.copyWith(
                      color:
                          controller.isSelected.value ? neutral100 : neutral60,
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
                          () => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.searchBankController
                                            .text.isNotEmpty
                                        ? controller.banksOnSearch.length
                                        : controller.banks.length,
                                    itemBuilder: (context, index) {
                                      if (controller.searchBankController.text
                                          .isNotEmpty) {
                                        return CardBank(
                                          bank: controller
                                              .banksOnSearch[index].bank!,
                                          gambar: controller
                                              .banksOnSearch[index].logo!,
                                          onTap: () {
                                            controller.selectedBank.value =
                                                controller
                                                    .banksOnSearch[index].bank!;
                                            controller.isSelected.value = true;
                                            Get.back();
                                          },
                                        );
                                      } else {
                                        return CardBank(
                                          bank: controller.banks[index].bank!,
                                          gambar: controller.banks[index].logo!,
                                          onTap: () {
                                            controller.selectedBank.value =
                                                controller.banks[index].bank!;
                                            controller.isSelected.value = true;
                                            Get.back();
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
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
          SizedBox(
            height: 41,
            width: 343,
            child: FloatingActionButton.extended(
              backgroundColor: primaryMain,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              onPressed: () => Get.toNamed(Routes.HOME),
              label: Text(
                'Selanjutnya',
                style: buttonTabsTextBold.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}