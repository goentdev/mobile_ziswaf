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
    final controller = Get.put(ProgramPageController());
    String filename = file;

    filename = filename.split("/")[7];
    filename = filename.substring(0, filename.indexOf('?'));
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
                  size: 10,
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
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Obx(() => Visibility(
                            visible: controller.isLoading.isFalse,
                            replacement: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 100,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 43,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Deskripsi',
                                    style: listItemTitleBold.copyWith(
                                        fontWeight: extraBold,
                                        color: neutral100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    deskripsi,
                                    textAlign: TextAlign.start,
                                    style: textSSemibold.copyWith(
                                        color: neutral90),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Obx(() => Visibility(
                            visible: controller.isLoading.isFalse,
                            replacement: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 50,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Berkas',
                                    style: listItemTitleBold.copyWith(
                                        fontWeight: extraBold,
                                        color: neutral100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Proposal Program',
                                    textAlign: TextAlign.start,
                                    style: textSSemibold.copyWith(
                                        color: neutral90),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1, color: neutral30)),
                                  padding: const EdgeInsets.all(16),
                                  height: 62,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 15,
                                              child: Image.asset(
                                                'assets/icons/file.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                filename,
                                                overflow: TextOverflow.visible,
                                                style: captionTextBold.copyWith(
                                                    color: neutral100),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: neutral70,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Gambar',
                                    textAlign: TextAlign.start,
                                    style: textSSemibold.copyWith(
                                        color: neutral90),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: NetworkImage(gambar),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Obx(
                        () => Visibility(
                          visible: controller.isLoading.isFalse,
                          replacement: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(
                                height: 50,
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Daftar Transaksi (${controller.totaltransaksiiD.value!.totalTransaksi})',
                                  style: listItemTitleBold.copyWith(
                                      color: neutral100),
                                ),
                              ),
                              GetBuilder<ProgramPageController>(
                                init: ProgramPageController(),
                                initState: (_) {},
                                builder: (_) {
                                  return Scrollbar(
                                    thumbVisibility: false,
                                    controller: controller.scrollController2,
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        controller.getTransaksis(id: id);
                                      },
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        controller:
                                            controller.scrollController2,
                                        shrinkWrap: true,
                                        itemCount: controller.transaksi!.length,
                                        itemBuilder: (context, index) {
                                          return DetailCard(
                                            muzakiId: controller
                                                    .transaksi![controller
                                                            .transaksi!.length -
                                                        1 -
                                                        index]
                                                    .muzaki
                                                    ?.id ??
                                                0,
                                            buktifotoTransaksi: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .buktiTransaksi,
                                            nomorResi: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .nomorResi,
                                            nomorRekening: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .nomorRekening,
                                            namaRekening: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .namaRekening,
                                            kategori: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .kategori,
                                            email: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .muzaki!
                                                .email,
                                            nomor: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .muzaki!
                                                .whatsapp,
                                            judul: judul,
                                            programId: id,
                                            id: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .id,
                                            icon: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .muzaki
                                                ?.nama,
                                            nama: controller
                                                    .transaksi![controller
                                                            .transaksi!.length -
                                                        1 -
                                                        index]
                                                    .muzaki
                                                    ?.nama ??
                                                '-',
                                            bank: controller
                                                    .transaksi![controller
                                                            .transaksi!.length -
                                                        1 -
                                                        index]
                                                    .bank
                                                    ?.nama ??
                                                '-',
                                            nominal: controller
                                                    .transaksi?[controller
                                                            .transaksi!.length -
                                                        1 -
                                                        index]
                                                    .totalTransaksi ??
                                                0,
                                            waktu: controller
                                                .transaksi![controller
                                                        .transaksi!.length -
                                                    1 -
                                                    index]
                                                .createdAt,
                                            bankId: controller
                                                    .transaksi![controller
                                                            .transaksi!.length -
                                                        1 -
                                                        index]
                                                    .bank
                                                    ?.id ??
                                                1,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
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
                  programId: id!,
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
