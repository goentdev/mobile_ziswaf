// ignore_for_file: unrelated_type_equality_checks

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
import '../../MuzakkiPage/controllers/muzakki_page_controller.dart';

class TambahTransaksi extends StatelessWidget {
  final String judul, nama, email, kategori;
  final String? nomor;
  final int id, programId;
  const TambahTransaksi(
      {super.key,
      required this.judul,
      required this.nama,
      required this.nomor,
      required this.id,
      required this.programId,
      required this.email,
      required this.kategori});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseBankController());

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
                    size: 16,
                  ),
                )),
            body: Form(
              key: controller.tambahtransaksiKey,
              child: Container(
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
                        gambar: nama,
                        nama: nama,
                        nomor: nomor,
                        judul: judul,
                        id: id,
                        programId: programId,
                        email: email,
                        kategori: kategori,
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
                                    child: Obx(
                                      () => Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          name: 'Rp',
                                          decimalDigits: 0,
                                        ).format(controller.nominalController.text ==
                                                ''
                                            ? 0
                                            : int.parse(controller
                                                    .nominalController.text) +
                                                int.parse(controller
                                                        .alokasi2.value
                                                    ? controller.nominal2Controller.text ==
                                                            ''
                                                        ? 0.toString()
                                                        : controller
                                                            .nominal2Controller
                                                            .text
                                                    : '0') +
                                                int.parse(controller
                                                        .alokasi3.value
                                                    ? controller.nominal3Controller
                                                                .text ==
                                                            ''
                                                        ? 0.toString()
                                                        : controller
                                                            .nominal3Controller
                                                            .text
                                                    : '0') +
                                                int.parse(controller.alokasi4.value
                                                    ? controller.nominal4Controller.text == ''
                                                        ? 0.toString()
                                                        : controller.nominal4Controller.text
                                                    : '0')),
                                        style: listItemTitleBlack.copyWith(
                                          color: primaryMain,
                                        ),
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
                                    value: controller.selectedDonasi.value,
                                    items: const [],
                                    onChanged: (value) {},
                                    icon: const Icon(
                                      CupertinoIcons.chevron_down,
                                      size: 12,
                                    ),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: neutral30),
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
                                          body: SingleChildScrollView(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
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
                                                        border:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        prefixIcon:
                                                            Icon(Icons.search),
                                                        hintText: 'Cari',
                                                      ),
                                                      onChanged: (value) {
                                                        controller.searchDonasi(
                                                            value);
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Scrollbar(
                                                    controller: controller
                                                        .firstController,
                                                    thumbVisibility: true,
                                                    child: ListView.builder(
                                                      controller: controller
                                                          .firstController,
                                                      shrinkWrap: true,
                                                      itemCount: controller
                                                              .searchDonasiController
                                                              .text
                                                              .isNotEmpty
                                                          ? controller
                                                              .jenisdonasionsearch
                                                              .length
                                                          : controller
                                                              .jenisdonasi
                                                              .length,
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
                                                                    vertical:
                                                                        16),
                                                            child: InkWell(
                                                              onTap: () {
                                                                controller
                                                                        .selectedJenisDonasiId
                                                                        .value =
                                                                    controller
                                                                        .jenisdonasionsearch[
                                                                            index]
                                                                        .id!;
                                                                controller
                                                                        .selectedDonasi
                                                                        .value =
                                                                    controller
                                                                        .jenisdonasionsearch[
                                                                            index]
                                                                        .nama!;
                                                                controller
                                                                    .isSelected
                                                                    .value = true;
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                controller
                                                                    .jenisdonasionsearch[
                                                                        index]
                                                                    .nama!,
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
                                                                    vertical:
                                                                        16),
                                                            child: InkWell(
                                                              onTap: () {
                                                                controller
                                                                        .selectedJenisDonasiId
                                                                        .value =
                                                                    controller
                                                                        .jenisdonasi[
                                                                            index]
                                                                        .id!;
                                                                controller
                                                                        .selectedDonasi
                                                                        .value =
                                                                    controller
                                                                        .jenisdonasi[
                                                                            index]
                                                                        .nama!;
                                                                controller
                                                                    .isSelected
                                                                    .value = true;
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                controller
                                                                    .jenisdonasi[
                                                                        index]
                                                                    .nama!,
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
                                validator: (v) {
                                  if (v == '0' || v == '') {
                                    return 'Nominal Harus di Isi';
                                  }
                                  return null;
                                },
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
                                height: 8,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Atas Nama',
                                  style: captionTextSemiBold.copyWith(
                                    color: neutral90,
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return 'Nama Harus di Isi';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.clearText();
                                },
                                keyboardType: TextInputType.name,
                                controller: controller.nameController,
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
                                  hintText: 'Masukan Nama',
                                  hintStyle:
                                      listTitleBold.copyWith(color: neutral60),
                                  isDense: true,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              controller.alokasi2 == false
                                  ? GestureDetector(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Alokasi 2",
                                              style: listTitleSemiBold.copyWith(
                                                  color: neutral100),
                                            ),
                                            controller.alokasi3.value
                                                ? const SizedBox()
                                                : GestureDetector(
                                                    onTap: () {
                                                      controller.addAlokasi2();
                                                      controller
                                                              .nominal2Controller =
                                                          TextEditingController(
                                                              text: '0');
                                                    },
                                                    child: Text(
                                                      "Hapus",
                                                      style:
                                                          linkTextBold.copyWith(
                                                              color:
                                                                  dangerMain),
                                                    ),
                                                  ),
                                          ],
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
                                                            .selectedDonasi2
                                                            .value
                                                        : 'Pilih Jenis Donasi',
                                                hintStyle: textMBold.copyWith(
                                                  color: controller
                                                          .isSelected2.value
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
                                                                color:
                                                                    neutral90),
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
                                                    body: SingleChildScrollView(
                                                      child: Center(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16),
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
                                                                  color:
                                                                      neutral40,
                                                                ),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      controller
                                                                          .searchDonasi2Controller,
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
                                                              Scrollbar(
                                                                thumbVisibility:
                                                                    true,
                                                                controller:
                                                                    controller
                                                                        .firstController2,
                                                                child: ListView
                                                                    .builder(
                                                                  controller:
                                                                      controller
                                                                          .firstController2,
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: controller
                                                                          .searchDonasi2Controller
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? controller
                                                                          .jenisdonasionsearch
                                                                          .length
                                                                      : controller
                                                                          .jenisdonasi
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    if (controller
                                                                        .searchDonasi2Controller
                                                                        .text
                                                                        .isNotEmpty) {
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 16),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.selectedJenisDonasiId2.value =
                                                                                controller.jenisdonasionsearch[index].id!;
                                                                            controller.selectedDonasi2.value =
                                                                                controller.jenisdonasionsearch[index].nama!;
                                                                            controller.isSelected2.value =
                                                                                true;
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            controller.jenisdonasionsearch[index].nama!,
                                                                            style:
                                                                                textMBold.copyWith(color: neutral100),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 16),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.selectedJenisDonasiId2.value =
                                                                                controller.jenisdonasi[index].id!;
                                                                            controller.selectedDonasi2.value =
                                                                                controller.jenisdonasi[index].nama!;
                                                                            controller.isSelected2.value =
                                                                                true;
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            controller.jenisdonasi[index].nama!,
                                                                            style:
                                                                                textMBold.copyWith(color: neutral100),
                                                                          ),
                                                                        ),
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
                                          validator: (v) {
                                            if (controller.alokasi2.value ==
                                                true) {
                                              if (v == '0' || v == '') {
                                                return 'Nominal Harus di Isi';
                                              }
                                            }
                                            return null;
                                          },
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
                                            disabledBorder:
                                                UnderlineInputBorder(
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
                                          height: 8,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Atas Nama',
                                            style: captionTextSemiBold.copyWith(
                                              color: neutral90,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          validator: (v) {
                                            if (controller.alokasi2.value ==
                                                true) {
                                              if (v!.isEmpty) {
                                                return 'Nama Harus di Isi';
                                              }
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            controller.clearText();
                                          },
                                          keyboardType: TextInputType.name,
                                          controller:
                                              controller.nameController2,
                                          style: captionTextSemiBold.copyWith(
                                            color: neutral100,
                                          ),
                                          enabled: true,
                                          decoration: InputDecoration(
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: neutral40,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            hintText: 'Masukan Nama',
                                            hintStyle: listTitleBold.copyWith(
                                                color: neutral60),
                                            isDense: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        controller.alokasi3 == false
                                            ? GestureDetector(
                                                onTap: () {
                                                  controller.addAlokasi3();
                                                },
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Image.asset(
                                                    'assets/icons/Button.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        // ignore: unrelated_type_equality_checks
                                        controller.alokasi3 == false
                                            ? const SizedBox()
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Alokasi 3",
                                                        style: listTitleSemiBold
                                                            .copyWith(
                                                                color:
                                                                    neutral100),
                                                      ),
                                                      controller.alokasi4.value
                                                          ? const SizedBox()
                                                          : GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .addAlokasi3();
                                                                controller
                                                                        .nominal3Controller =
                                                                    TextEditingController(
                                                                        text:
                                                                            '0');
                                                              },
                                                              child: Text(
                                                                "Hapus",
                                                                style: linkTextBold
                                                                    .copyWith(
                                                                        color:
                                                                            dangerMain),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Jenis Donasi',
                                                      style: captionTextSemiBold
                                                          .copyWith(
                                                              color: neutral90),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Obx(
                                                    () => GestureDetector(
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: controller
                                                            .selectedDonasi3
                                                            .value,
                                                        items: const [],
                                                        onChanged: (value) {},
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .chevron_down,
                                                          size: 12,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    neutral30),
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: neutral30,
                                                              width: 4,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          hintText: controller
                                                                  .isSelected3
                                                                  .value
                                                              ? controller
                                                                  .selectedDonasi3
                                                                  .value
                                                              : 'Pilih Jenis Donasi',
                                                          hintStyle: textMBold
                                                              .copyWith(
                                                            color: controller
                                                                    .isSelected3
                                                                    .value
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
                                                              Colors
                                                                  .transparent,
                                                          builder: (context) {
                                                            return Scaffold(
                                                              appBar: AppBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 0,
                                                                title: Text(
                                                                  'Pilih Jenis Donasi',
                                                                  style: textMBlack
                                                                      .copyWith(
                                                                          color:
                                                                              neutral90),
                                                                ),
                                                                leading:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () => Get
                                                                          .back(),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_back_ios,
                                                                    color:
                                                                        neutral90,
                                                                    size: 16,
                                                                  ),
                                                                ),
                                                                centerTitle:
                                                                    true,
                                                              ),
                                                              body:
                                                                  SingleChildScrollView(
                                                                controller:
                                                                    controller
                                                                        .firstController,
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          16),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          color:
                                                                              neutral40,
                                                                        ),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              controller.searchDonasi3Controller,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            disabledBorder:
                                                                                InputBorder.none,
                                                                            focusedBorder:
                                                                                InputBorder.none,
                                                                            prefixIcon:
                                                                                Icon(Icons.search),
                                                                            hintText:
                                                                                ' ',
                                                                          ),
                                                                          onChanged:
                                                                              (value) {
                                                                            controller.searchDonasi(value);
                                                                          },
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              8),
                                                                      Scrollbar(
                                                                        thumbVisibility:
                                                                            true,
                                                                        controller:
                                                                            controller.firstController3,
                                                                        child: ListView
                                                                            .builder(
                                                                          controller:
                                                                              controller.firstController3,
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: controller.searchDonasi3Controller.text.isNotEmpty
                                                                              ? controller.jenisdonasionsearch.length
                                                                              : controller.jenisdonasi.length,
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            if (controller.searchDonasi3Controller.text.isNotEmpty) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    controller.selectedJenisDonasiId3.value = controller.jenisdonasionsearch[index].id!;
                                                                                    controller.selectedDonasi3.value = controller.jenisdonasi[index].nama!;
                                                                                    controller.isSelected3.value = true;
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Text(
                                                                                    controller.jenisdonasionsearch[index].nama!,
                                                                                    style: textMBold.copyWith(color: neutral100),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    controller.selectedJenisDonasiId3.value = controller.jenisdonasi[index].id!;
                                                                                    controller.selectedDonasi3.value = controller.jenisdonasi[index].nama!;
                                                                                    controller.isSelected3.value = true;
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Text(
                                                                                    controller.jenisdonasi[index].nama!,
                                                                                    style: textMBold.copyWith(color: neutral100),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Nominal',
                                                      style: captionTextSemiBold
                                                          .copyWith(
                                                        color: neutral90,
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    validator: (v) {
                                                      if (controller
                                                              .alokasi3.value ==
                                                          true) {
                                                        if (v == '0' ||
                                                            v == '') {
                                                          return 'Nominal Harus di Isi';
                                                        }
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      controller.clearText();
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    controller: controller
                                                        .nominal3Controller,
                                                    style: captionTextSemiBold
                                                        .copyWith(
                                                      color: neutral100,
                                                    ),
                                                    enabled: true,
                                                    decoration: InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: neutral40,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      hintText:
                                                          'Tuliskan Nominal',
                                                      hintStyle: listTitleBold
                                                          .copyWith(
                                                              color: neutral60),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Atas Nama',
                                                      style: captionTextSemiBold
                                                          .copyWith(
                                                        color: neutral90,
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    validator: (v) {
                                                      if (controller
                                                              .alokasi3.value ==
                                                          true) {
                                                        if (v!.isEmpty) {
                                                          return 'Nama Harus di Isi';
                                                        }
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      controller.clearText();
                                                    },
                                                    keyboardType:
                                                        TextInputType.name,
                                                    controller: controller
                                                        .nameController3,
                                                    style: captionTextSemiBold
                                                        .copyWith(
                                                      color: neutral100,
                                                    ),
                                                    enabled: true,
                                                    decoration: InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: neutral40,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      hintText: 'Masukan Nama',
                                                      hintStyle: listTitleBold
                                                          .copyWith(
                                                              color: neutral60),
                                                      isDense: true,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  controller.alokasi4 == false
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .addAlokasi4();
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Image.asset(
                                                              'assets/icons/Button.png',
                                                              width: 30,
                                                              height: 30,
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                  // ignore: unrelated_type_equality_checks
                                                  controller.alokasi4 == false
                                                      ? const SizedBox()
                                                      : Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Alokasi 4",
                                                                  style: listTitleSemiBold
                                                                      .copyWith(
                                                                          color:
                                                                              neutral100),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .addAlokasi4();
                                                                    controller
                                                                            .nominal4Controller =
                                                                        TextEditingController(
                                                                            text:
                                                                                '0');
                                                                  },
                                                                  child: Text(
                                                                    "Hapus",
                                                                    style: linkTextBold
                                                                        .copyWith(
                                                                            color:
                                                                                dangerMain),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Jenis Donasi',
                                                                style: captionTextSemiBold
                                                                    .copyWith(
                                                                        color:
                                                                            neutral90),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),
                                                            Obx(
                                                              () =>
                                                                  GestureDetector(
                                                                child:
                                                                    DropdownButtonFormField(
                                                                  value: controller
                                                                      .selectedDonasi4
                                                                      .value,
                                                                  items: const [],
                                                                  onChanged:
                                                                      (value) {},
                                                                  icon:
                                                                      const Icon(
                                                                    CupertinoIcons
                                                                        .chevron_down,
                                                                    size: 12,
                                                                  ),
                                                                  decoration:
                                                                      InputDecoration(
                                                                    border:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: neutral30),
                                                                    ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            neutral30,
                                                                        width:
                                                                            4,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    hintText: controller
                                                                            .isSelected4
                                                                            .value
                                                                        ? controller
                                                                            .selectedDonasi4
                                                                            .value
                                                                        : 'Pilih Jenis Donasi',
                                                                    hintStyle:
                                                                        textMBold
                                                                            .copyWith(
                                                                      color: controller
                                                                              .isSelected4
                                                                              .value
                                                                          ? neutral90
                                                                          : neutral60,
                                                                    ),
                                                                    isDense:
                                                                        true,
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    enableDrag:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    builder:
                                                                        (context) {
                                                                      return Scaffold(
                                                                        appBar:
                                                                            AppBar(
                                                                          backgroundColor:
                                                                              Colors.white,
                                                                          elevation:
                                                                              0,
                                                                          title:
                                                                              Text(
                                                                            'Pilih Jenis Donasi',
                                                                            style:
                                                                                textMBlack.copyWith(color: neutral90),
                                                                          ),
                                                                          leading:
                                                                              IconButton(
                                                                            onPressed: () =>
                                                                                Get.back(),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.arrow_back_ios,
                                                                              color: neutral90,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                          centerTitle:
                                                                              true,
                                                                        ),
                                                                        body:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                const EdgeInsets.symmetric(horizontal: 16),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  height: 40,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    color: neutral40,
                                                                                  ),
                                                                                  child: TextField(
                                                                                    controller: controller.searchDonasi4Controller,
                                                                                    decoration: const InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      disabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      prefixIcon: Icon(Icons.search),
                                                                                      hintText: 'Cari',
                                                                                    ),
                                                                                    onChanged: (value) {
                                                                                      controller.searchDonasi(value);
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(height: 8),
                                                                                Scrollbar(
                                                                                  controller: controller.firstController,
                                                                                  thumbVisibility: true,
                                                                                  child: ListView.builder(
                                                                                    physics: const AlwaysScrollableScrollPhysics(),
                                                                                    controller: controller.firstController,
                                                                                    shrinkWrap: true,
                                                                                    itemCount: controller.searchDonasi4Controller.text.isNotEmpty ? controller.jenisdonasionsearch.length : controller.jenisdonasi.length,
                                                                                    itemBuilder: (context, index) {
                                                                                      if (controller.searchDonasi4Controller.text.isNotEmpty) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                          child: InkWell(
                                                                                            onTap: () {
                                                                                              controller.selectedJenisDonasiId4.value = controller.jenisdonasionsearch[index].id!;
                                                                                              controller.selectedDonasi4.value = controller.jenisdonasionsearch[index].nama!;
                                                                                              controller.isSelected4.value = true;
                                                                                              Get.back();
                                                                                            },
                                                                                            child: Text(
                                                                                              controller.jenisdonasionsearch[index].nama!,
                                                                                              style: textMBold.copyWith(color: neutral100),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                          child: InkWell(
                                                                                            onTap: () {
                                                                                              controller.selectedJenisDonasiId4.value = controller.jenisdonasi[index].id!;
                                                                                              controller.selectedDonasi4.value = controller.jenisdonasi[index].nama!;
                                                                                              controller.isSelected4.value = true;
                                                                                              Get.back();
                                                                                            },
                                                                                            child: Text(
                                                                                              controller.jenisdonasi[index].nama!,
                                                                                              style: textMBold.copyWith(color: neutral100),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
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
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Nominal',
                                                                style:
                                                                    captionTextSemiBold
                                                                        .copyWith(
                                                                  color:
                                                                      neutral90,
                                                                ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              validator: (v) {
                                                                if (controller
                                                                        .alokasi4
                                                                        .value ==
                                                                    true) {
                                                                  if (v ==
                                                                          '0' ||
                                                                      v == '') {
                                                                    return 'Nominal Harus di Isi';
                                                                  }
                                                                }
                                                                return null;
                                                              },
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .clearText();
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              inputFormatters: <
                                                                  TextInputFormatter>[
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              controller: controller
                                                                  .nominal4Controller,
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral100,
                                                              ),
                                                              enabled: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                disabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        neutral40,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                hintText:
                                                                    'Tuliskan Nominal',
                                                                hintStyle: listTitleBold
                                                                    .copyWith(
                                                                        color:
                                                                            neutral60),
                                                                isDense: true,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Atas Nama',
                                                                style:
                                                                    captionTextSemiBold
                                                                        .copyWith(
                                                                  color:
                                                                      neutral90,
                                                                ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              validator: (v) {
                                                                if (controller
                                                                        .alokasi4
                                                                        .value ==
                                                                    true) {
                                                                  if (v!
                                                                      .isEmpty) {
                                                                    return 'Nama Harus di Isi';
                                                                  }
                                                                }
                                                                return null;
                                                              },
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .clearText();
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .name,
                                                              controller: controller
                                                                  .nameController4,
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral100,
                                                              ),
                                                              enabled: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                disabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        neutral40,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                hintText:
                                                                    'Masukan Nama',
                                                                hintStyle: listTitleBold
                                                                    .copyWith(
                                                                        color:
                                                                            neutral60),
                                                                isDense: true,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 24,
                                                            ),
                                                          ],
                                                        )
                                                ],
                                              )
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
                  Get.delete<MuzakkiPageController>();
                  if (controller.tambahtransaksiKey.currentState!.validate() &&
                      controller.selectedJenisDonasiId.value != 0 &&
                      controller.alokasi2 == false &&
                      controller.alokasi3 == false &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksi(
                          jenisdonasiId: [
                            controller.selectedJenisDonasiId.value
                          ],
                          id: id,
                          programId: programId,
                          nominal: [controller.nominalController.text],
                          jenisDonasi: [controller.selectedDonasi.value],
                          judul: judul,
                          nama: nama,
                          nomor: nomor!,
                          email: email,
                          kategori: kategori,
                          atasNama: [controller.nameController.text],
                        ));
                  } else if (controller.tambahtransaksiKey.currentState!
                          .validate() &&
                      controller.selectedJenisDonasiId2.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == false &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksi(
                          jenisdonasiId: [
                            controller.selectedJenisDonasiId.value,
                            controller.selectedJenisDonasiId2.value
                          ],
                          email: email,
                          kategori: kategori,
                          judul: judul,
                          nama: nama,
                          nomor: nomor!,
                          id: id,
                          programId: programId,
                          nominal: [
                            controller.nominalController.text,
                            controller.nominal2Controller.text
                          ],
                          jenisDonasi: [
                            controller.selectedDonasi.value,
                            controller.selectedDonasi2.value
                          ],
                          atasNama: [
                            controller.nameController.text,
                            controller.nameController2.text
                          ],
                        ));
                  } else if (controller.tambahtransaksiKey.currentState!
                          .validate() &&
                      controller.selectedJenisDonasiId3.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == true &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksi(
                          jenisdonasiId: [
                            controller.selectedJenisDonasiId.value,
                            controller.selectedJenisDonasiId2.value,
                            controller.selectedJenisDonasiId3.value
                          ],
                          email: email,
                          kategori: kategori,
                          judul: judul,
                          nama: nama,
                          nomor: nomor!,
                          id: id,
                          programId: programId,
                          nominal: [
                            controller.nominalController.text,
                            controller.nominal2Controller.text,
                            controller.nominal3Controller.text
                          ],
                          jenisDonasi: [
                            controller.selectedDonasi.value,
                            controller.selectedDonasi2.value,
                            controller.selectedDonasi3.value
                          ],
                          atasNama: [
                            controller.nameController.text,
                            controller.nameController2.text,
                            controller.nameController3.text
                          ],
                        ));
                  } else if (controller.tambahtransaksiKey.currentState!
                          .validate() &&
                      controller.selectedJenisDonasiId4.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == true &&
                      controller.alokasi4 == true) {
                    Get.to(() => BuktiTransaksi(
                          jenisdonasiId: [
                            controller.selectedJenisDonasiId.value,
                            controller.selectedJenisDonasiId2.value,
                            controller.selectedJenisDonasiId3.value,
                            controller.selectedJenisDonasiId4.value
                          ],
                          email: email,
                          kategori: kategori,
                          judul: judul,
                          nama: nama,
                          nomor: nomor!,
                          id: id,
                          programId: programId,
                          nominal: [
                            controller.nominalController.text,
                            controller.nominal2Controller.text,
                            controller.nominal3Controller.text,
                            controller.nominal4Controller.text
                          ],
                          jenisDonasi: [
                            controller.selectedDonasi.value,
                            controller.selectedDonasi2.value,
                            controller.selectedDonasi3.value,
                            controller.selectedDonasi4.value
                          ],
                          atasNama: [
                            controller.nameController.text,
                            controller.nameController2.text,
                            controller.nameController3.text,
                            controller.nameController4.text
                          ],
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Harap Lengkapi Form Diatas',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
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
