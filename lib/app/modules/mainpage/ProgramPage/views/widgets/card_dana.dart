import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/detail_program_page.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../theme/colors.dart';
import '../../controllers/program_page_controller.dart';

class CardDana extends StatelessWidget {
  final String judul, tanggalakhir, persenn, deskripsi, file, gambar, banner;
  final int terkumpul, target, muzakki;
  final int? id, totalTransaksi;

  const CardDana(
      {super.key,
      required this.id,
      required this.judul,
      required this.terkumpul,
      required this.target,
      required this.tanggalakhir,
      required this.muzakki,
      this.totalTransaksi,
      required this.persenn,
      required this.deskripsi,
      required this.file,
      required this.gambar,
      required this.banner});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramPageController());
    double persen = target / 100;
    double target100v = target / persen;
    final now = DateTime.now();
    final tanggaltutup = DateTime(now.year, now.month, now.day);
    int target100 = target100v.toInt();
    double target1v = terkumpul / persen;
    int target1 = target1v.toInt();
    return InkWell(
      onTap: () {
        controller.getTransaksis(id: id);

        controller.totaltransaksi(id: id);
        Get.offAll(() => DetailProgram(
            judul: judul,
            tanggalakhir: tanggalakhir,
            terkumpul: terkumpul,
            target: target,
            target1: target1,
            target100: target100,
            totalTransaksi: totalTransaksi,
            id: id,
            persenn: persenn,
            deskripsi: deskripsi,
            file: file,
            gambar: gambar,
            banner: banner));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 20.5),
            decoration: BoxDecoration(
              color: neutral10,
              border: Border(
                bottom: BorderSide(color: neutral40),
                left: BorderSide(color: neutral40),
                top: BorderSide(color: neutral40),
                right: BorderSide(color: neutral40),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      'assets/icons/calendar.png',
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
                          judul,
                          style: listTitleSemiBold.copyWith(color: neutral100),
                        ),
                        Text(
                          '$muzakki Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral70),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Terkumpul',
                      style: captionTextSemiBold.copyWith(color: neutral70),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          name: 'Rp',
                          decimalDigits: 0,
                        ).format(terkumpul),
                        style: captionTextSemiBold.copyWith(color: neutral100),
                      ),
                      DateTime.parse(tanggalakhir).compareTo(tanggaltutup) >= 0
                          ? Text(
                              Jiffy(tanggalakhir).fromNow(),
                              style: captionTextBold.copyWith(
                                  color: secondaryMain),
                            )
                          : Text(
                              'Selesai',
                              style:
                                  captionTextBold.copyWith(color: primaryMain),
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LinearPercentIndicator(
                    alignment: MainAxisAlignment.start,
                    barRadius: const Radius.circular(20),
                    lineHeight: 6,
                    animation: true,
                    percent: double.parse(persenn) / 100,
                    trailing: Text(
                      '$target1%',
                      style: titleExtraTextBold.copyWith(color: neutral100),
                    ),
                    progressColor: primaryMain,
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
