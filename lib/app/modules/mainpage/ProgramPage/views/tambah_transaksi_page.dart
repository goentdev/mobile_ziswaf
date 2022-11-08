import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/bukti_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_Muzakki.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../../auth/controllers/choose_bank_controller.dart';

class TambahTransaksi extends StatelessWidget {
  final String judul, nama;
  final String? nomor;
  const TambahTransaksi(
      {super.key,
      required this.judul,
      required this.nama,
      required this.nomor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseBankController());
    bool alokasi2 = false;
    return GetBuilder<ChooseBankController>(
        init: ChooseBankController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Tambah Transaksi',
                  style: listTitleBold.copyWith(color: neutral90),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: neutral90,
                    size: 10,
                  ),
                )),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Muzakki',
                        style: listItemTitleBold.copyWith(color: neutral100),
                      ),
                    ),
                    CardMuzakki(
                      nama: nama,
                      nomor: nomor,
                      judul: judul,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Program',
                        style: listItemTitleBold.copyWith(color: neutral100),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 67,
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: neutral30,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/calendar.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            judul,
                            style:
                                listTitleSemiBold.copyWith(color: neutral100),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Alokasi',
                            style:
                                listItemTitleBold.copyWith(color: neutral100),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.clearText();
                          },
                          child: GetBuilder<ChooseBankController>(
                              init: ChooseBankController(),
                              initState: (_) {},
                              builder: (_) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    NumberFormat.currency(
                                      locale: 'id',
                                      name: 'Rp',
                                      decimalDigits: 0,
                                    ).format(controller
                                                .nominalController.text ==
                                            ''
                                        ? 0
                                        : int.parse(
                                            controller.nominalController.text)),
                                    style: listItemTitleBlack.copyWith(
                                      color: primaryMain,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: neutral30,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alokasi 1",
                              style:
                                  listTitleSemiBold.copyWith(color: neutral100),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Jenis Donasi',
                                style: captionTextSemiBold.copyWith(
                                    color: neutral90),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Obx(
                              () => GestureDetector(
                                child: DropdownButtonFormField(
                                  value: controller.selectedDonasi.value,
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
                                        ? controller.selectedDonasi.value
                                        : 'Pilih Jenis Donasi',
                                    hintStyle: textMBold.copyWith(
                                      color: controller.isSelected.value
                                          ? neutral90
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
                                            'Pilih Jenis Donasi',
                                            style: textMBlack.copyWith(
                                                color: neutral90),
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
                                        body: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: neutral40,
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .searchDonasiController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      prefixIcon:
                                                          Icon(Icons.search),
                                                      hintText: 'Cari',
                                                    ),
                                                    onChanged: (value) {
                                                      controller
                                                          .searchDonasi(value);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                          .searchDonasiController
                                                          .text
                                                          .isNotEmpty
                                                      ? controller
                                                          .donasisOnSearch
                                                          .length
                                                      : controller
                                                          .donasis.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    if (controller
                                                        .searchDonasiController
                                                        .text
                                                        .isNotEmpty) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 16),
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller
                                                                    .selectedDonasi
                                                                    .value =
                                                                controller
                                                                    .donasisOnSearch[
                                                                        index]
                                                                    .jenisDonasi!;
                                                            controller
                                                                .isSelected
                                                                .value = true;
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                            controller
                                                                .donasisOnSearch[
                                                                    index]
                                                                .jenisDonasi!,
                                                            style: textMBold
                                                                .copyWith(
                                                                    color:
                                                                        neutral100),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 16),
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller
                                                                    .selectedDonasi
                                                                    .value =
                                                                controller
                                                                    .donasis[
                                                                        index]
                                                                    .jenisDonasi!;
                                                            controller
                                                                .isSelected
                                                                .value = true;
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                            controller
                                                                .donasis[index]
                                                                .jenisDonasi!,
                                                            style: textMBold
                                                                .copyWith(
                                                                    color:
                                                                        neutral100),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
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
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nominal',
                                style: captionTextSemiBold.copyWith(
                                  color: neutral90,
                                ),
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                controller.clearText();
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: controller.nominalController,
                              style: captionTextSemiBold.copyWith(
                                color: neutral100,
                              ),
                              enabled: true,
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: neutral40,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                hintText: 'Tuliskan Nominal',
                                hintStyle:
                                    listTitleBold.copyWith(color: neutral60),
                                isDense: true,
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            controller.alokasi2 == false
                                ? InkWell(
                                    onTap: () {
                                      controller.addAlokasi2();
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        'assets/icons/Button.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            // ignore: unrelated_type_equality_checks
                            controller.alokasi2 == false
                                ? const SizedBox()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Alokasi 2",
                                        style: listTitleSemiBold.copyWith(
                                            color: neutral100),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Jenis Donasi',
                                          style: captionTextSemiBold.copyWith(
                                              color: neutral90),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Obx(
                                        () => GestureDetector(
                                          child: DropdownButtonFormField(
                                            value: controller
                                                .selectedDonasi2.value,
                                            items: const [],
                                            onChanged: (value) {},
                                            icon: const Icon(
                                              CupertinoIcons.chevron_down,
                                              size: 12,
                                            ),
                                            decoration: InputDecoration(
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: neutral30),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: neutral30,
                                                  width: 4,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              hintText:
                                                  controller.isSelected2.value
                                                      ? controller
                                                          .selectedDonasi2.value
                                                      : 'Pilih Jenis Donasi',
                                              hintStyle: textMBold.copyWith(
                                                color:
                                                    controller.isSelected2.value
                                                        ? neutral90
                                                        : neutral60,
                                              ),
                                              isDense: true,
                                            ),
                                          ),
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              enableDrag: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (context) {
                                                return Scaffold(
                                                  appBar: AppBar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 0,
                                                    title: Text(
                                                      'Pilih Jenis Donasi',
                                                      style:
                                                          textMBlack.copyWith(
                                                              color: neutral90),
                                                    ),
                                                    leading: IconButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      icon: Icon(
                                                        Icons.arrow_back_ios,
                                                        color: neutral90,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    centerTitle: true,
                                                  ),
                                                  body: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: neutral40,
                                                            ),
                                                            child: TextField(
                                                              controller: controller
                                                                  .searchDonasiController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .search),
                                                                hintText:
                                                                    'Cari',
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .searchDonasi(
                                                                        value);
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: controller
                                                                    .searchDonasiController
                                                                    .text
                                                                    .isNotEmpty
                                                                ? controller
                                                                    .donasisOnSearch
                                                                    .length
                                                                : controller
                                                                    .donasis
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              if (controller
                                                                  .searchDonasiController
                                                                  .text
                                                                  .isNotEmpty) {
                                                                return Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          16),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                              .selectedDonasi
                                                                              .value =
                                                                          controller
                                                                              .donasisOnSearch[index]
                                                                              .jenisDonasi!;
                                                                      controller
                                                                          .isSelected
                                                                          .value = true;
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      controller
                                                                          .donasisOnSearch[
                                                                              index]
                                                                          .jenisDonasi!,
                                                                      style: textMBold.copyWith(
                                                                          color:
                                                                              neutral100),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          16),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                              .selectedDonasi
                                                                              .value =
                                                                          controller
                                                                              .donasis[index]
                                                                              .jenisDonasi!;
                                                                      controller
                                                                          .isSelected
                                                                          .value = true;
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      controller
                                                                          .donasis[
                                                                              index]
                                                                          .jenisDonasi!,
                                                                      style: textMBold.copyWith(
                                                                          color:
                                                                              neutral100),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ],
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
                                        height: 8,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Nominal',
                                          style: captionTextSemiBold.copyWith(
                                            color: neutral90,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          controller.clearText();
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        controller:
                                            controller.nominal2Controller,
                                        style: captionTextSemiBold.copyWith(
                                          color: neutral100,
                                        ),
                                        enabled: true,
                                        decoration: InputDecoration(
                                          disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: neutral40,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          hintText: 'Tuliskan Nominal',
                                          hintStyle: listTitleBold.copyWith(
                                              color: neutral60),
                                          isDense: true,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: neutral30, width: 1),
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryMain,
                ),
                onPressed: () async {
                  Get.to(() => const BuktiTransaksi());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lanjut Transfer',
                      style: textMBold.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
