import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/bukti_transaksi_page.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class KonfirmasiPage extends StatelessWidget {
  const KonfirmasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Konfirmasi Transaksi',
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
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
                        'Sedekah Bangunan Infrastruktur',
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
                    initialValue: 'Alif Pramana Putra',
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
                    initialValue: '08211234321',
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
                    initialValue: 'alifpramana@gmail.com',
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
                    initialValue: 'Personal',
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
                      'Nama',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'Alif Pramana Putra',
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
                      'Nomor Rekening',
                      style: captionTextSemiBold.copyWith(
                        color: neutral70,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue:
                        'Bank Mandiri - 1640001233211\na/n Alif Pramana Putra',
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
                    initialValue: '01929331774881',
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/radio.png',
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Zakat Maal',
                            style: captionTextRegular,
                          ),
                          Text(
                            ' - ',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                          Text(
                            'Rp100.000',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/radio.png',
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Zakat Fitrah',
                            style: captionTextRegular,
                          ),
                          Text(
                            ' - ',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                          Text(
                            'Rp75.000',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/radio.png',
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Infaq',
                            style: captionTextRegular,
                          ),
                          Text(
                            ' - ',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                          Text(
                            'Rp75.000',
                            style: percentTittle.copyWith(
                              color: neutral100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            GetBuilder(
              init: controller,
              builder: (controller) => controller.identityImage == null
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
                                    Container(
                                      height: 245,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 1, color: neutral50),
                                          image: DecorationImage(
                                              image: FileImage(File(controller
                                                  .identityImage!.path)),
                                              fit: BoxFit.contain)),
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
            'Simpan',
            style: textMBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
