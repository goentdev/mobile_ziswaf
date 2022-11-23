import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../controllers/program_page_controller.dart';

class Deskripsi extends StatelessWidget {
  final String judul, tanggalakhir, persenn, deskripsi, file, gambar, banner;
  final int terkumpul, target, target1, target100;
  final int? id, totalTransaksi;
  const Deskripsi(
      {super.key,
      required this.judul,
      required this.tanggalakhir,
      required this.persenn,
      required this.deskripsi,
      required this.file,
      required this.gambar,
      required this.banner,
      required this.terkumpul,
      required this.target,
      required this.target1,
      required this.target100,
      this.id,
      this.totalTransaksi});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramPageController());
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
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
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deskripsi',
                    style: listItemTitleBold.copyWith(
                        fontWeight: extraBold, color: neutral100),
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
                    style: textSSemibold.copyWith(color: neutral90),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
