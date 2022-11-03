import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/ubah_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/detail_card.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:appbar_animated/appbar_animated.dart';

class DetailProgram extends StatelessWidget {
  final String judul, tanggalakhir;
  final int terkumpul, target, target1, target100;

  const DetailProgram(
      {super.key,
      required this.judul,
      required this.tanggalakhir,
      required this.terkumpul,
      required this.target,
      required this.target1,
      required this.target100});

  @override
  Widget build(BuildContext context) {
    final progC = Get.put(ProgramPageController());
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: ScaffoldLayoutBuilder(
        duration: const Duration(milliseconds: 350),
        backgroundColorAppBar:
            const ColorBuilder(Colors.transparent, Color(0xffECF7F4)),
        textColorAppBar: ColorBuilder(neutral90),
        appBarBuilder: (context, colorAnimated) {
          return AppBar(
              elevation: 0,
              backgroundColor: colorAnimated.background,
              centerTitle: true,
              title: Text(
                judul,
                style: listTitleBold.copyWith(color: colorAnimated.color),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.offNamed(Routes.MAINPAGE);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: neutral90,
                  size: 10,
                ),
              ));
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 219,
                    decoration: BoxDecoration(
                      color: successurface,
                      image: const DecorationImage(
                          image:
                              AssetImage('assets/images/detail_background.png'),
                          opacity: 0.1,
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 63, 16, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Terkumpul',
                            style: captionTextSemiBold.copyWith(
                              color: neutral70,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  name: 'Rp',
                                  decimalDigits: 0,
                                ).format(terkumpul),
                                style: listItemTitleBold.copyWith(
                                    color: neutral100),
                              ),
                              Text(
                                Jiffy(tanggalakhir).fromNow(),
                                style: captionTextBold.copyWith(
                                    color: primaryMain),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Daftar Transaksi (4)',
                        style: listItemTitleBold.copyWith(color: neutral100),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hari Ini',
                                    style: captionTextBold.copyWith(
                                        color: neutral90),
                                  )
                                ],
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '1 Hari lalu',
                                    style: captionTextBold.copyWith(
                                        color: neutral90),
                                  )
                                ],
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Jum’at, 16 September 2022',
                                    style: captionTextBold.copyWith(
                                        color: neutral90),
                                  )
                                ],
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const DetailCard(
                                icon: 'assets/icons/ap.png',
                                nama: 'Alif Pramana Putra',
                                bank: 'Bank Mandiri',
                                nominal: 200000,
                                waktu: '2022-10-10 10:22:00',
                              ),
                              const SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 172, 16, 0),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                height: 91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: neutral30, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 8),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/target.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Target Anda',
                                style: captionTextSemiBold.copyWith(
                                    color: neutral70),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  name: 'Rp',
                                  decimalDigits: 0,
                                ).format(target),
                                style:
                                    listTitleBold.copyWith(color: neutral100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    LinearPercentIndicator(
                      barRadius: const Radius.circular(100),
                      lineHeight: 6,
                      animation: true,
                      trailing: Text(
                        '$target1%',
                        style: titleExtraTextBold.copyWith(color: neutral100),
                      ),
                      percent: target1 / target100,
                      progressColor: primaryMain,
                    ),
                  ],
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
          onPressed: () {
            Get.to(() => UbahTransaksiPage(
                  judul: judul,
                ));
          },
          child: Text(
            'Tambah Transaksi',
            style: textMBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
