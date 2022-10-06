import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/pages/carousel.dart';
import 'package:mobile_ziswaf/pages/identitas_page.dart';
import 'package:mobile_ziswaf/pages/login_page.dart';
import 'package:mobile_ziswaf/widget/card_bank.dart';

import '../theme.dart';

class PilihBank extends StatefulWidget {
  const PilihBank({super.key});

  @override
  State<PilihBank> createState() => _PilihBankState();
}

class _PilihBankState extends State<PilihBank> {
  late String SelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Masukan Rekening Bank',
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
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    backgroundColor: Colors.transparent,
                    context: context,
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: neutral90,
                              size: 16,
                            ),
                          ),
                          centerTitle: true,
                        ),
                        body: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: neutral40),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Cari',
                                    ),
                                  ),
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                                const CardBank(
                                  bank: 'Bank BCA',
                                  gambar: 'assets/BCA.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: neutral30,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: InputBorder.none,
                        hintText: 'Pilih Bank',
                        hintStyle: textMBold.copyWith(color: neutral60),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/down_icon.png',
                          width: 16,
                          height: 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 8,
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
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: neutral30, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Masukkan nomor Rekening',
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
                'Rekening Atas Nama',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: neutral30,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: 'Masukkan nama rekening',
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
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ));
                },
                label: Text(
                  'Simpan ',
                  style: buttonTabsTextBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          ]),
    );
  }
}
