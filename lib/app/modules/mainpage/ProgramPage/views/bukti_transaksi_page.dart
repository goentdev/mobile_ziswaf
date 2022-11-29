import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller2.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/konfirmasi_page..dart';
import 'package:photo_view/photo_view.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../../auth/controllers/identity_controller.dart';
import '../../../auth/views/register/widgets/card_bank.dart';
import 'package:path/path.dart';

class BuktiTransaksi extends StatelessWidget {
  final int id, programId;
  final List<String> nominal, jenisDonasi;
  final List<int> jenisdonasiId;
  final String judul, nama, nomor, email, kategori;

  const BuktiTransaksi({
    super.key,
    required this.id,
    required this.programId,
    required this.nominal,
    required this.jenisDonasi,
    required this.judul,
    required this.nama,
    required this.nomor,
    required this.email,
    required this.kategori,
    required this.jenisdonasiId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseBankController());
    final controller2 = Get.put(IdentityController());
    final controller3 = Get.put(ChooseBankController2());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Unggah Bukti Transfer',
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
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryBorder, width: 1),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/nominal_background.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nominal Transaksi',
                    style: captionTextSemiBold.copyWith(color: neutral90),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', name: 'Rp', decimalDigits: 0)
                        .format(int.parse(controller.nominalController.text) +
                            int.parse(controller.nominal2Controller.text) +
                            int.parse(controller.nominal3Controller.text) +
                            int.parse(controller.nominal4Controller.text) +
                            int.parse(controller3.nominalController.text) +
                            int.parse(controller3.nominal2Controller.text) +
                            int.parse(controller3.nominal3Controller.text) +
                            int.parse(controller3.nominal4Controller.text)),
                    style: listItemTitleBlack.copyWith(color: primaryMain),
                  ),
                ],
              ),
            ),
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
                    hintText: controller.isSelectedBank.value
                        ? controller.selectedBank.value
                        : 'Pilih Bank',
                    hintStyle: textMBold.copyWith(
                      color: controller.isSelectedBank.value
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
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.9,
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
                                      Scrollbar(
                                        thumbVisibility: true,
                                        controller: controller.firstController,
                                        child: ListView.builder(
                                          controller:
                                              controller.firstController,
                                          shrinkWrap: true,
                                          itemCount: controller
                                                  .searchBankController
                                                  .text
                                                  .isNotEmpty
                                              ? controller.banksOnSearch.length
                                              : controller.banks.length,
                                          itemBuilder: (context, index) {
                                            if (controller.searchBankController
                                                .text.isNotEmpty) {
                                              return CardBank(
                                                bank: controller
                                                    .banksOnSearch[index].nama!,
                                                gambar: controller
                                                    .banksOnSearch[index]
                                                    .image!,
                                                onTap: () {
                                                  controller
                                                          .selectedBank.value =
                                                      controller
                                                          .banksOnSearch[index]
                                                          .nama!;
                                                  controller.banks[index].nama!;
                                                  controller.selectedBankId
                                                          .value =
                                                      controller
                                                          .banksOnSearch[index]
                                                          .id!;
                                                  controller.isSelectedBank
                                                      .value = true;
                                                  Get.back();
                                                },
                                                id: controller
                                                    .banksOnSearch[index].id!,
                                              );
                                            } else {
                                              return CardBank(
                                                bank: controller
                                                    .banks[index].nama!,
                                                gambar: controller
                                                    .banks[index].image!,
                                                onTap: () {
                                                  controller
                                                          .selectedBank.value =
                                                      controller
                                                          .banks[index].nama!;
                                                  controller.selectedBankId
                                                          .value =
                                                      controller
                                                          .banks[index].id!;
                                                  controller.isSelectedBank
                                                      .value = true;
                                                  Get.back();
                                                },
                                                id: controller.banks[index].id!,
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
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Resi',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controller.nomorResiController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: neutral30,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: 'Masukkan Nomor Resi',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),
            GetBuilder(
              init: IdentityController(),
              builder: (controller) => controller.identityImage == null
                  ? InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          constraints: const BoxConstraints(maxHeight: 170),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 5,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: neutral30,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    'Unggah Bukti Transfer',
                                    style: titleTextBold.copyWith(
                                        color: neutral100),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.pickFromCamera(context);
                                        },
                                        child: SizedBox(
                                          height: 86,
                                          width: 163,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/camera.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Foto dari kamera',
                                                style: captionTextSemiBold
                                                    .copyWith(
                                                  color: neutral80,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.pickFromGallery(context);
                                        },
                                        child: SizedBox(
                                          height: 86,
                                          width: 163,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/gallery.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Pilih dari galeri',
                                                style: captionTextSemiBold
                                                    .copyWith(
                                                  color: neutral80,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: neutral30)),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 62,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 15,
                                  child: Image.asset(
                                    'assets/icons/file2.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Unggah Bukti Transfer',
                                  style: captionTextBold.copyWith(
                                      color: neutral100),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: neutral70,
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: neutral30)),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      height: 62,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    constraints:
                                        const BoxConstraints(maxHeight: 1000),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return FractionallySizedBox(
                                        heightFactor: 0.5,
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 16, 16, 0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: neutral30,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(PhotoView(
                                                      imageProvider: FileImage(
                                                          File(controller
                                                              .identityImage!
                                                              .path))));
                                                },
                                                child: Container(
                                                  height: 245,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: neutral50),
                                                      image: DecorationImage(
                                                          image: FileImage(File(
                                                              controller
                                                                  .identityImage!
                                                                  .path)),
                                                          fit: BoxFit.contain)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                'Bukti Transfer Harus Sesuai Dengan Nominal yang tertera',
                                                style: titleTextBold.copyWith(
                                                    color: neutral80),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 80),
                                                      height: 41,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: primaryMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        'Kembali',
                                                        style:
                                                            textMBold.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: primaryMain,
                                    radius: 15,
                                    child: Image.asset(
                                      'assets/icons/file.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller.identityImage!.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: captionTextBold.copyWith(
                                          color: neutral100),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                constraints:
                                    const BoxConstraints(maxHeight: 170),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 10),
                                        Container(
                                          height: 5,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: neutral30,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          'Unggah Bukti Transfer',
                                          style: titleTextBold.copyWith(
                                              color: neutral100),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .pickFromCamera(context);
                                              },
                                              child: SizedBox(
                                                height: 86,
                                                width: 163,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/camera.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'Foto dari kamera',
                                                      style: captionTextSemiBold
                                                          .copyWith(
                                                        color: neutral80,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .pickFromGallery(context);
                                              },
                                              child: SizedBox(
                                                height: 86,
                                                width: 163,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/gallery.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'Pilih dari galeri',
                                                      style: captionTextSemiBold
                                                          .copyWith(
                                                        color: neutral80,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/icons/change.png',
                              width: 43,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 100),
          ]),
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
            Get.to(KonfirmasiPage(
              jenisdonasiId: jenisdonasiId,
              id: id,
              programId: programId,
              nominal: nominal,
              jenisDonasi: jenisDonasi,
              nomorRekening: controller.bankAccountController.text,
              namaRekening: controller.accountNameController.text,
              nomorResi: controller.nomorResiController.text,
              buktiTransaksi: controller2.identityImage!.path,
              bankId: controller.selectedBankId.value,
              judul: judul,
              nama: nama,
              nomor: nomor,
              email: email,
              kategori: kategori,
            ));
          },
          child: Text(
            'Selanjutnya',
            style: textMBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
