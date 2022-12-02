// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/bukti_transaksi_page(edit).dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/bukti_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_Muzakki.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_muzakki(EDIT).dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_muzakki(edit)2.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_showmdal_muzakki.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/views/mainpage_view.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../../auth/controllers/choose_bank_controller.dart';
import '../../../auth/controllers/choose_bank_controller2.dart';
import '../controllers/program_page_controller.dart';

class EditTransaksi2 extends StatelessWidget {
  final String judul, nama, whatsapp, email, kategori;
  final String? nomor,
      nomorRekening,
      namaRekening,
      nomoResi,
      bankNama,
      buktifotoTransaksi;

  final int muzakiId, programId, transaksiId, bankId;
  const EditTransaksi2({
    super.key,
    required this.judul,
    required this.nama,
    required this.nomor,
    required this.muzakiId,
    required this.programId,
    required this.whatsapp,
    required this.email,
    required this.kategori,
    required this.transaksiId,
    required this.nomorRekening,
    required this.namaRekening,
    required this.nomoResi,
    required this.bankNama,
    required this.buktifotoTransaksi,
    required this.bankId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseBankController2());
    final controller2 = Get.put(ProgramPageController());
    if (controller2.alokasi!.length == 1) {
      controller.alokasitrue.value = controller2.alokasi!.elementAt(0).id!;
      controller.nameController.text =
          controller2.alokasi?.elementAt(0).atasNama ?? '';
      controller.selectedJenisDonasiId.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.id!;
      controller.selectedJenisDonasiId.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.id!;
      controller.selectedDonasi.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.nama!;
      controller.nominalController.text =
          controller2.alokasi!.elementAt(0).nominal!.toString();
      controller.nominal2Controller.text = '0';
      controller.selectedDonasi2.value = 'Pilih Jenis Donasi';
      controller.nameController2.text = '';
      controller.nominal3Controller.text = '0';
      controller.selectedDonasi3.value = 'Pilih Jenis Donasi';
      controller.nameController3.text = '';
      controller.nominal4Controller.text = '0';
      controller.selectedDonasi4.value = 'Pilih Jenis Donasi';
      controller.nameController4.text = '';
    } else if (controller2.alokasi!.length == 2) {
      controller.alokasitrue.value = controller2.alokasi!.elementAt(0).id!;
      controller.nameController.text =
          controller2.alokasi?.elementAt(0).atasNama ?? '';
      controller.selectedJenisDonasiId.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.id!;
      controller.selectedDonasi.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.nama!;
      controller.nominalController.text =
          controller2.alokasi!.elementAt(0).nominal!.toString();
      controller.alokasitrue2.value = controller2.alokasi!.elementAt(1).id!;
      controller.nameController2.text =
          controller2.alokasi?.elementAt(1).atasNama ?? '';
      controller.selectedJenisDonasiId2.value =
          controller2.alokasi!.elementAt(1).jenisDonasi!.id!;
      controller.nominal2Controller.text =
          controller2.alokasi!.elementAt(1).nominal!.toString();
      controller.selectedDonasi2.value =
          controller2.alokasi?.elementAt(1).jenisDonasi!.nama! ?? '';
      controller.nameController3.text = '';
      controller.nominal3Controller.text = '0';
      controller.selectedDonasi3.value = 'Pilih Jenis Donasi';
      controller.nameController4.text = '';
      controller.nominal4Controller.text = '0';
      controller.selectedDonasi4.value = 'Pilih Jenis Donasi';
      controller.alokasi2.value = true;
    } else if (controller2.alokasi!.length == 3) {
      controller.alokasitrue.value = controller2.alokasi!.elementAt(0).id!;
      controller.nameController.text =
          controller2.alokasi?.elementAt(0).atasNama ?? '';
      controller.selectedJenisDonasiId.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.id!;
      controller.selectedDonasi.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.nama!;
      controller.nominalController.text =
          controller2.alokasi!.elementAt(0).nominal!.toString();
      controller.alokasitrue2.value = controller2.alokasi!.elementAt(1).id!;
      controller.nameController2.text =
          controller2.alokasi?.elementAt(1).atasNama ?? '';
      controller.selectedJenisDonasiId2.value =
          controller2.alokasi!.elementAt(1).jenisDonasi!.id!;
      controller.nominal2Controller.text =
          controller2.alokasi!.elementAt(1).nominal!.toString();
      controller.selectedDonasi2.value =
          controller2.alokasi?.elementAt(1).jenisDonasi!.nama! ?? '';
      controller.alokasitrue3.value = controller2.alokasi!.elementAt(2).id!;
      controller.nameController3.text =
          controller2.alokasi?.elementAt(2).atasNama ?? '';
      controller.selectedJenisDonasiId3.value =
          controller2.alokasi!.elementAt(2).jenisDonasi!.id!;
      controller.selectedDonasi3.value =
          controller2.alokasi?.elementAt(2).jenisDonasi!.nama ?? '';
      controller.nominal3Controller.text =
          controller2.alokasi!.elementAt(2).nominal!.toString();
      controller.nominal4Controller.text = '0';
      controller.selectedDonasi4.value = 'Pilih Jenis Donasi';
      controller.nameController4.text = '';
      controller.alokasi2.value = true;
      controller.alokasi3.value = true;
    } else if (controller2.alokasi!.length == 4) {
      controller.alokasitrue.value = controller2.alokasi!.elementAt(0).id!;
      controller.nameController.text =
          controller2.alokasi!.elementAt(0).atasNama ?? '';
      controller.selectedJenisDonasiId.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.id!;
      controller.selectedDonasi.value =
          controller2.alokasi!.elementAt(0).jenisDonasi!.nama!;
      controller.nominalController.text =
          controller2.alokasi!.elementAt(0).nominal!.toString();
      controller.alokasitrue2.value = controller2.alokasi!.elementAt(1).id!;
      controller.nameController2.text =
          controller2.alokasi?.elementAt(1).atasNama ?? '';
      controller.selectedJenisDonasiId2.value =
          controller2.alokasi!.elementAt(1).jenisDonasi!.id!;
      controller.nominal2Controller.text =
          controller2.alokasi!.elementAt(1).nominal!.toString();
      controller.selectedDonasi2.value =
          controller2.alokasi?.elementAt(1).jenisDonasi!.nama! ?? '';
      controller.alokasitrue3.value = controller2.alokasi!.elementAt(2).id!;
      controller.nameController3.text =
          controller2.alokasi?.elementAt(2).atasNama ?? '';
      controller.selectedJenisDonasiId3.value =
          controller2.alokasi!.elementAt(2).jenisDonasi!.id!;
      controller.selectedDonasi3.value =
          controller2.alokasi?.elementAt(2).jenisDonasi!.nama ?? '';
      controller.nominal3Controller.text =
          controller2.alokasi!.elementAt(2).nominal!.toString();
      controller.alokasitrue4.value = controller2.alokasi!.elementAt(3).id!;
      controller.nameController4.text =
          controller2.alokasi?.elementAt(3).atasNama ?? '';
      controller.selectedJenisDonasiId4.value =
          controller2.alokasi!.elementAt(3).jenisDonasi!.id!;
      controller.selectedDonasi4.value =
          controller2.alokasi?.elementAt(3).jenisDonasi!.nama ?? '';
      controller.nominal4Controller.text =
          controller2.alokasi!.elementAt(3).nominal!.toString();
      controller.alokasi2.value = true;
      controller.alokasi3.value = true;
      controller.alokasi4.value = true;
    }
    controller.getJenisdonasi(id: programId);

    return GetBuilder<ChooseBankController2>(
        init: ChooseBankController2(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Edit Transaksi',
                  style: listTitleBold.copyWith(color: neutral90),
                ),
                leading: IconButton(
                  onPressed: () async {
                    Get.offAll(() => const MainpageView());
                    await controller2.gettotalberlangsungg2();
                    await controller2.gettotalselesai();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: neutral90,
                    size: 16,
                  ),
                )),
            body: Form(
              key: controller.editFormKey,
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
                          'Muzaki',
                          style: listItemTitleBold.copyWith(color: neutral100),
                        ),
                      ),
                      CardMuzakkiEdit2(
                        bank: bankNama,
                        buktifototransfer: buktifotoTransaksi,
                        namaRekening: namaRekening,
                        nomorRekening: nomorRekening,
                        nomorResi: nomoResi,
                        transaksiId: transaksiId,
                        nama: nama,
                        nomor: nomor,
                        judul: judul,
                        gambar: nama,
                        id: muzakiId,
                        programId: programId,
                        bankId: bankId,
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
                            child: GetBuilder<ChooseBankController2>(
                                init: ChooseBankController2(),
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
                                      hintText: controller.selectedDonasi.value,
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
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                            .searchDonasiController
                                                            .text
                                                            .isNotEmpty
                                                        ? controller
                                                            .jenisdonasionsearch
                                                            .length
                                                        : controller
                                                            .jenisdonasi.length,
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
                                                                  vertical: 16),
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
                                                hintText: controller
                                                    .selectedDonasi2.value,
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
                                                                color:
                                                                    neutral40,
                                                              ),
                                                              child: TextField(
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
                                                            ListView.builder(
                                                              shrinkWrap: true,
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
                                                                  return controller
                                                                              .selectedDonasi
                                                                              .value !=
                                                                          controller
                                                                              .jenisdonasionsearch[index]
                                                                              .nama!
                                                                      ? Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: 16),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              controller.selectedJenisDonasiId2.value = controller.jenisdonasionsearch[index].id!;
                                                                              controller.selectedDonasi2.value = controller.jenisdonasionsearch[index].nama!;
                                                                              controller.isSelected2.value = true;
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              controller.jenisdonasionsearch[index].nama!,
                                                                              style: textMBold.copyWith(color: neutral100),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : const SizedBox();
                                                                } else {
                                                                  return controller
                                                                              .selectedDonasi
                                                                              .value !=
                                                                          controller
                                                                              .jenisdonasi[index]
                                                                              .nama!
                                                                      ? Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: 16),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              controller.selectedJenisDonasiId2.value = controller.jenisdonasi[index].id!;
                                                                              controller.selectedDonasi2.value = controller.jenisdonasi[index].nama!;
                                                                              controller.isSelected2.value = true;
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              controller.jenisdonasi[index].nama!,
                                                                              style: textMBold.copyWith(color: neutral100),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : const SizedBox();
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
                                                              .selectedDonasi3
                                                              .value,
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
                                                              body: Container(
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        16),
                                                                child:
                                                                    SingleChildScrollView(
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
                                                                                'Cari',
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
                                                                      ListView
                                                                          .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: controller.searchDonasi3Controller.text.isNotEmpty
                                                                            ? controller.jenisdonasionsearch.length
                                                                            : controller.jenisdonasi.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          if (controller
                                                                              .searchDonasi3Controller
                                                                              .text
                                                                              .isNotEmpty) {
                                                                            return controller.selectedDonasi.value != controller.jenisdonasionsearch[index].nama! && controller.selectedDonasi2.value != controller.jenisdonasionsearch[index].nama!
                                                                                ? Padding(
                                                                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        controller.selectedJenisDonasiId3.value = controller.jenisdonasionsearch[index].id!;
                                                                                        controller.selectedDonasi3.value = controller.jenisdonasionsearch[index].nama!;
                                                                                        controller.isSelected3.value = true;
                                                                                        Get.back();
                                                                                      },
                                                                                      child: Text(
                                                                                        controller.jenisdonasionsearch[index].nama!,
                                                                                        style: textMBold.copyWith(color: neutral100),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : const SizedBox();
                                                                          } else {
                                                                            return controller.selectedDonasi.value != controller.jenisdonasi[index].nama! && controller.selectedDonasi2.value != controller.jenisdonasi[index].nama!
                                                                                ? Padding(
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
                                                                                  )
                                                                                : const SizedBox();
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
                                                      if (v == '0' || v == '') {
                                                        return 'Nominal Harus di Isi';
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
                                                      if (v!.isEmpty) {
                                                        return 'Nama Harus di Isi';
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
                                                                        .selectedDonasi4
                                                                        .value,
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
                                                                            Container(
                                                                          margin:
                                                                              const EdgeInsets.symmetric(horizontal: 16),
                                                                          child:
                                                                              SingleChildScrollView(
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
                                                                                ListView.builder(
                                                                                  shrinkWrap: true,
                                                                                  itemCount: controller.searchDonasi4Controller.text.isNotEmpty ? controller.jenisdonasionsearch.length : controller.jenisdonasi.length,
                                                                                  itemBuilder: (context, index) {
                                                                                    if (controller.searchDonasi4Controller.text.isNotEmpty) {
                                                                                      return controller.selectedDonasi.value != controller.jenisdonasionsearch[index].nama! && controller.selectedDonasi2.value != controller.jenisdonasionsearch[index].nama! && controller.selectedDonasi3.value != controller.jenisdonasionsearch[index].nama!
                                                                                          ? Padding(
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
                                                                                            )
                                                                                          : const SizedBox();
                                                                                    } else {
                                                                                      return controller.selectedDonasi.value != controller.jenisdonasi[index].nama! && controller.selectedDonasi2.value != controller.jenisdonasi[index].nama! && controller.selectedDonasi3.value != controller.jenisdonasi[index].nama!
                                                                                          ? Padding(
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
                                                                                            )
                                                                                          : const SizedBox();
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
                                                                if (v == '0' ||
                                                                    v == '') {
                                                                  return 'Nominal Harus di Isi';
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
                                                                if (v!
                                                                    .isEmpty) {
                                                                  return 'Nama Harus di Isi';
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
                  if (controller.editFormKey.currentState!.validate() &&
                      controller.selectedJenisDonasiId.value != 0 &&
                      controller.alokasi2 == false &&
                      controller.alokasi3 == false &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksiEdit(
                        alokasiId: [controller.alokasitrue.value],
                        atasNama: [controller.nameController.text],
                        jenisdonasiId: [controller.selectedJenisDonasiId.value],
                        bankId: bankId,
                        buktifotoTransaksi: buktifotoTransaksi,
                        bankNama: bankNama,
                        namRekening: namaRekening,
                        nomorRekening: nomorRekening,
                        nomorResi: nomoResi,
                        id: muzakiId,
                        transaksiId: transaksiId,
                        programId: programId,
                        nominal: [controller.nominalController.text],
                        jenisDonasi: [controller.selectedDonasi.value],
                        judul: judul,
                        nama: nama,
                        nomor: nomor!,
                        email: email,
                        kategori: kategori));
                  } else if (controller.editFormKey.currentState!.validate() &&
                      controller.selectedJenisDonasiId.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == false &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksiEdit(
                        alokasiId: [
                          controller.alokasitrue.value,
                        ],
                        atasNama: [
                          controller.nameController.text,
                          controller.nameController2.text
                        ],
                        jenisdonasiId: [
                          controller.selectedJenisDonasiId.value,
                          controller.selectedJenisDonasiId2.value,
                        ],
                        bankId: bankId,
                        buktifotoTransaksi: buktifotoTransaksi,
                        bankNama: bankNama,
                        namRekening: namaRekening,
                        nomorRekening: nomorRekening,
                        nomorResi: nomoResi,
                        id: muzakiId,
                        transaksiId: transaksiId,
                        programId: programId,
                        nominal: [
                          controller.nominalController.text,
                          controller.nominal2Controller.text,
                        ],
                        jenisDonasi: [
                          controller.selectedDonasi.value,
                          controller.selectedDonasi2.value
                        ],
                        judul: judul,
                        nama: nama,
                        nomor: nomor!,
                        email: email,
                        kategori: kategori));
                  } else if (controller.editFormKey.currentState!.validate() &&
                      controller.selectedJenisDonasiId.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == true &&
                      controller.alokasi4 == false) {
                    Get.to(() => BuktiTransaksiEdit(
                        alokasiId: [
                          controller.alokasitrue.value,
                        ],
                        atasNama: [
                          controller.nameController.text,
                          controller.nameController2.text,
                          controller.nameController3.text
                        ],
                        jenisdonasiId: [
                          controller.selectedJenisDonasiId.value,
                          controller.selectedJenisDonasiId2.value,
                          controller.selectedJenisDonasiId3.value
                        ],
                        bankId: bankId,
                        buktifotoTransaksi: buktifotoTransaksi,
                        bankNama: bankNama,
                        namRekening: namaRekening,
                        nomorRekening: nomorRekening,
                        nomorResi: nomoResi,
                        transaksiId: transaksiId,
                        email: email,
                        kategori: kategori,
                        judul: judul,
                        nama: nama,
                        nomor: nomor!,
                        id: muzakiId,
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
                        ]));
                  } else if (controller.editFormKey.currentState!.validate() &&
                      controller.selectedJenisDonasiId.value != 0 &&
                      controller.alokasi2 == true &&
                      controller.alokasi3 == true &&
                      controller.alokasi4 == true) {
                    Get.to(() => BuktiTransaksiEdit(
                        alokasiId: [
                          controller.alokasitrue.value,
                        ],
                        atasNama: [
                          controller.nameController.text,
                          controller.nominal2Controller.text,
                          controller.nominal3Controller.text,
                          controller.nominal4Controller.text
                        ],
                        jenisdonasiId: [
                          controller.selectedJenisDonasiId.value,
                          controller.selectedJenisDonasiId2.value,
                          controller.selectedJenisDonasiId3.value,
                          controller.selectedJenisDonasiId4.value
                        ],
                        bankId: bankId,
                        buktifotoTransaksi: buktifotoTransaksi,
                        bankNama: bankNama,
                        namRekening: namaRekening,
                        nomorRekening: nomorRekening,
                        nomorResi: nomoResi,
                        email: email,
                        kategori: kategori,
                        judul: judul,
                        nama: nama,
                        transaksiId: transaksiId,
                        nomor: nomor!,
                        id: muzakiId,
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
                        ]));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selanjutnya',
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
