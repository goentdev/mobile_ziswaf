import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/tab_bar.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/ubah_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/berkas.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/deskripsi.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/detail_card.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/transaksi.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:appbar_animated/appbar_animated.dart';

import '../../../../data/models/transaksi_model.dart';

class DetailProgram extends StatelessWidget {
  final String judul, tanggalakhir, persenn, deskripsi, file, gambar, banner;
  final int terkumpul, target, target1, target100;
  final int? id, totalTransaksi;

  const DetailProgram(
      {super.key,
      required this.judul,
      required this.tanggalakhir,
      required this.terkumpul,
      required this.target,
      required this.target1,
      required this.target100,
      required this.totalTransaksi,
      required this.id,
      required this.persenn,
      required this.deskripsi,
      required this.file,
      required this.gambar,
      required this.banner});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final tanggaltutup = DateTime(now.year, now.month, now.day);
    final controller = Get.put(ProgramPageController());
    controller.totaltransaksi(id: id);

    return Scaffold(
      extendBody: true,
      backgroundColor: neutral20,
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
                  controller.gettotalberlangsungg();
                  controller.gettotalselesai();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: neutral90,
                  size: 16,
                ),
              ));
        },
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getTransaksis(id: id);
            controller.refreshProgram();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 219,
                      decoration: BoxDecoration(
                        color: successurface,
                        image: DecorationImage(
                            image: NetworkImage(banner),
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
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      color: Colors.white,
                      child: MyTabBar(
                          onTap: (index) {
                            if (index == 0) {
                              controller.totaltransaksi(id: id);
                              controller.height.value = true;
                            } else {
                              controller.totaltransaksi(id: id);
                              controller.height.value = false;
                            }
                          },
                          controller: controller.tab2Controller,
                          tabs: const [
                            Tab(
                              text: 'Transaksi',
                            ),
                            Tab(
                              text: 'Berkas',
                            ),
                            Tab(text: 'Deskripsi'),
                          ]),
                    ),
                    Obx(
                      () => SizedBox(
                        width: double.maxFinite,
                        height: controller.isLoading3.value == false
                            ? controller.height.value == true
                                ? controller.totaltransaksiiD.value!
                                            .totalTransaksi! >
                                        5
                                    ? controller.totaltransaksiiD.value!
                                            .totalTransaksi! *
                                        105
                                    : 1000
                                : 1000
                            : 1000,
                        child: TabBarView(
                            controller: controller.tab2Controller,
                            children: [
                              TransaksiDetail(
                                  totalTransaksi: totalTransaksi,
                                  id: id,
                                  judul: judul,
                                  tanggalakhir: tanggalakhir,
                                  persenn: persenn,
                                  deskripsi: deskripsi,
                                  file: file,
                                  gambar: gambar,
                                  banner: banner,
                                  terkumpul: terkumpul,
                                  target: target,
                                  target1: target1,
                                  target100: target100),
                              Berkas(
                                  totalTransaksi: totalTransaksi,
                                  id: id,
                                  judul: judul,
                                  tanggalakhir: tanggalakhir,
                                  persenn: persenn,
                                  deskripsi: deskripsi,
                                  file: file,
                                  gambar: gambar,
                                  banner: banner,
                                  terkumpul: terkumpul,
                                  target: target,
                                  target1: target1,
                                  target100: target100),
                              Deskripsi(
                                  totalTransaksi: totalTransaksi,
                                  id: id,
                                  judul: judul,
                                  tanggalakhir: tanggalakhir,
                                  persenn: persenn,
                                  deskripsi: deskripsi,
                                  file: file,
                                  gambar: gambar,
                                  banner: banner,
                                  terkumpul: terkumpul,
                                  target: target,
                                  target1: target1,
                                  target100: target100),
                            ]),
                      ),
                    ),
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
                        percent: double.parse(persenn) / 100,
                        progressColor: primaryMain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          DateTime.parse(tanggalakhir).compareTo(tanggaltutup) >= 0
              ? Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            programId: id!,
                          ));
                    },
                    child: Text(
                      'Tambah Transaksi',
                      style: textMBold.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
    );
  }
}
