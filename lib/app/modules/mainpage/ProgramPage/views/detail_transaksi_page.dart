import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/choose_bank_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/bukti_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/edit_transaksi_page.dart';
import 'package:photo_view/photo_view.dart';
import '../../../../routes/app_pages.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class DetailTransaksi extends StatelessWidget {
  final String? nama,
      nomor,
      email,
      kategori,
      bank,
      nomorRekening,
      namaRekening,
      nomorResi,
      jenisDonasi,
      tanggaltransfer,
      nomoResi,
      bankNama,
      fotobuktiTransaksi,
      buktifotoTransaksi;
  final String judul, whatsapp;
  final int muzakiId, transaksiId, bankId;
  final int? id, programId;
  final int? status;
  final int? nominalDonasi, totalNominalTransaksi;

  const DetailTransaksi({
    super.key,
    required this.nama,
    required this.judul,
    required this.nomor,
    required this.email,
    required this.bank,
    required this.nomorRekening,
    required this.namaRekening,
    required this.nomorResi,
    required this.tanggaltransfer,
    required this.totalNominalTransaksi,
    required this.buktifotoTransaksi,
    this.kategori,
    this.jenisDonasi,
    this.nominalDonasi,
    required this.id,
    required this.programId,
    this.nomoResi,
    this.bankNama,
    this.fotobuktiTransaksi,
    required this.whatsapp,
    required this.muzakiId,
    required this.transaksiId,
    required this.bankId,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityController());
    final controller2 = Get.put(ProgramPageController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Detail Transaksi',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 10,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                constraints: const BoxConstraints(maxHeight: 126),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            color: neutral30,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () async {
                            await controller2.getAlokasiDana(id: id);
                            await controller2.getJenisdonasi(id: programId!);
                            Get.back();
                            Get.to(() => EditTransaksiPage(
                                judul: judul,
                                nama: nama!,
                                nomor: nomor,
                                muzakiId: muzakiId,
                                programId: programId!,
                                whatsapp: whatsapp,
                                email: email!,
                                kategori: kategori!,
                                transaksiId: transaksiId,
                                nomorRekening: nomorRekening,
                                namaRekening: namaRekening,
                                nomoResi: nomoResi,
                                bankNama: bankNama,
                                fotobuktiTransaksi: fotobuktiTransaksi,
                                bankId: bankId));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/pensil.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Ubah',
                                style: buttonTabsTextBold.copyWith(
                                    color: neutral70),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 308,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 48),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 75,
                                          width: 75,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                const Color(0XffFEF7EC),
                                            child: Image.asset(
                                              'assets/icons/iconseru.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Text(
                                          'Yakin Ingin Menghapus Data?',
                                          style: listItemTitleBlack.copyWith(
                                            color: neutral100,
                                          ),
                                        ),
                                        const SizedBox(height: 48),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 24),
                                                  height: 41,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: neutral40,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Batal',
                                                    style: textMBold.copyWith(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  await controller2
                                                      .deleteTransaksi(id);
                                                  await controller2
                                                      .getPrograms();
                                                  await controller2
                                                      .gettotalberlangsungg();
                                                  await controller2
                                                      .gettotalselesai();
                                                  await controller2
                                                      .getTransaksis(
                                                          id: programId);
                                                  Get.offAllNamed(
                                                      Routes.MAINPAGE);
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 24),
                                                  height: 41,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: dangerMain,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Hapus',
                                                    style: textMBold.copyWith(
                                                        color: dangerMain),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/trash.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Hapus',
                                style: buttonTabsTextBold.copyWith(
                                    color: dangerMain),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/icons/detail_icon.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 111,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryBorder, width: 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(status == 0
                      ? 'assets/images/diprosess.png'
                      : status == 1
                          ? 'assets/images/detail_transaksi22.png'
                          : 'assets/images/ditolakk.png'),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 69,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          status == 0
                              ? 'Transaksi Menunggu Konfirmasi'
                              : status == 1
                                  ? 'Transaksi Berhasil Diproses'
                                  : 'Transaksi Ditolak',
                          style: listTitleSemiBold.copyWith(
                            color: neutral100,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Jiffy(tanggaltransfer)
                              .format("do MMMM yyyy, h:mm:ss a"),
                          style: overlineSemiBold.copyWith(
                            color: neutral70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            name: 'Rp',
                            decimalDigits: 0,
                          ).format(totalNominalTransaksi),
                          style: listItemTitleBlack.copyWith(
                            color: status == 0
                                ? secondaryMain
                                : status == 1
                                    ? primaryMain
                                    : dangerMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 557,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: neutral30,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendar.png',
                        width: 30,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        judul,
                        style: listTitleSemiBold.copyWith(color: neutral100),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: nama,
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan Nama',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Whatsapp',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: nomor,
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan Nomer Whatsapp',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: email,
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan..',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori Muzakki',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: kategori,
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan..',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nomor Rekening',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: '$bank - $nomorRekening\na/n $namaRekening',
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan..',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nomer Resi',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: nomorResi ?? '-',
                    style: captionTextSemiBold.copyWith(
                      color: neutral100,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: neutral40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'Tuliskan Nama',
                      hintStyle: listTitleBold.copyWith(color: neutral60),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alokasi Dana',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller2.alokasi!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.asset(
                              'assets/icons/radio.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              controller2.alokasi![index].jenisDonasi!.nama!,
                              style: captionTextRegular,
                            ),
                            Text(
                              ' - ',
                              style: percentTittle.copyWith(
                                color: neutral100,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp')
                                  .format(
                                controller2.alokasi![index].nominal!,
                              ),
                              style: percentTittle.copyWith(
                                color: neutral100,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            GetBuilder(
              init: controller,
              builder: (controller) => buktifotoTransaksi == null
                  ? InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          constraints: const BoxConstraints(maxHeight: 1000),
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: neutral30,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      height: 245,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.image_not_supported_rounded,
                                            color: Colors.red,
                                            size: 120,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Transaksi Ini Belum Memiliki Foto Bukti Transfer',
                                      style: titleExtraTextBold.copyWith(
                                          color: neutral100),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              height: 41,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 1,
                                                  color: primaryMain,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'Kembali',
                                                style: textMBold.copyWith(
                                                    color: primaryMain),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.back();
                                              showModalBottomSheet(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 170),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                  ),
                                                ),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        16, 0, 16, 16),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                            height: 10),
                                                        Container(
                                                          height: 5,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: neutral30,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 18),
                                                        Text(
                                                          'Unggah Bukti Transfer',
                                                          style: titleTextBold
                                                              .copyWith(
                                                                  color:
                                                                      neutral100),
                                                        ),
                                                        const SizedBox(
                                                            height: 16),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .pickFromCamera(
                                                                        context);
                                                              },
                                                              child: SizedBox(
                                                                height: 86,
                                                                width: 163,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/icons/camera.png',
                                                                      height:
                                                                          30,
                                                                      width: 30,
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            8),
                                                                    Text(
                                                                      'Foto dari kamera',
                                                                      style: captionTextSemiBold
                                                                          .copyWith(
                                                                        color:
                                                                            neutral80,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .pickFromGallery(
                                                                        context);
                                                              },
                                                              child: SizedBox(
                                                                height: 86,
                                                                width: 163,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/icons/gallery.png',
                                                                      height:
                                                                          30,
                                                                      width: 30,
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            8),
                                                                    Text(
                                                                      'Pilih dari galeri',
                                                                      style: captionTextSemiBold
                                                                          .copyWith(
                                                                        color:
                                                                            neutral80,
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
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              height: 41,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: primaryMain,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'Upload Bukti Transfer',
                                                style: textMBold.copyWith(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                  'Lihat bukti transfer',
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
                  : InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          constraints: const BoxConstraints(maxHeight: 1000),
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: neutral30,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(PhotoView(
                                            imageProvider: NetworkImage(
                                                buktifotoTransaksi!)));
                                      },
                                      child: Container(
                                        height: 245,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                width: 1, color: neutral50),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    buktifotoTransaksi!),
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
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 80),
                                            height: 41,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: primaryMain,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Kembali',
                                              style: textMBold.copyWith(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                    'assets/icons/file.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Lihat bukti transfer',
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
                    ),
            ),
          ],
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
            Get.back();
          },
          child: Text(
            'Kembali',
            style: textMBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
