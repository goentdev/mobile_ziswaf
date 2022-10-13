import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class DetailTransaksi extends StatelessWidget {
  const DetailTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () {
              showModalBottomSheet(
                constraints: const BoxConstraints(maxHeight: 110),
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
                    height: 70,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
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
                          onTap: () {},
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
                              )
                            ],
                          ),
                        ),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/detail_transaksi.png'),
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
                          'Transaksi Berhasil Diproses',
                          style: listTitleSemiBold.copyWith(
                            color: neutral100,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '01 September 2022 08:41:30 WIB',
                          style: overlineSemiBold.copyWith(
                            color: neutral70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Rp250.000',
                          style: listItemTitleBlack.copyWith(
                            color: primaryMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            InkWell(
              onTap: () => Get.toNamed(Routes.CHANGEPASSWORD),
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
                          style: captionTextBold.copyWith(color: neutral100),
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