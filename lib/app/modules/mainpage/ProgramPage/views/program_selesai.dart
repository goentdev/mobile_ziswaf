// ignore_for_file: iterable_contains_unrelated_type, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:get/get.dart';
import '../../../../theme/colors.dart';
import '../controllers/program_page_controller.dart';

class ProgramSudahSelesai extends StatelessWidget {
  const ProgramSudahSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramPageController());
    controller.gettotalselesai2();
    final now = DateTime.now();
    final tanggaltutup = DateTime(now.year, now.month, now.day);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              'Daftar Program (${controller.selesai.value!.total ?? 0})',
              style: listItemTitleBold.copyWith(color: neutral100),
            ),
          ),
          Expanded(
            child: GetBuilder<ProgramPageController>(
              init: ProgramPageController(),
              initState: (_) {},
              builder: (_) {
                return RefreshIndicator(
                    onRefresh: () async {
                      controller.refreshProgram();
                    },
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: controller.program!.length,
                      itemBuilder: (context, index) {
                        if (DateTime.parse(controller.program![index].tanggal!)
                                .compareTo(tanggaltutup) >=
                            0) {
                          return const SizedBox();
                        } else {
                          return CardDana(
                            totalTransaksi: controller
                                .totaltransaksiiD.value!.totalTransaksi,
                            judul: controller.program![index].nama!,
                            terkumpul:
                                controller.program?[index].totalDana ?? 0,
                            target: controller.program![index].targetDana!,
                            tanggalakhir: controller.program![index].tanggal!,
                            muzakki: controller.program![index].totalMuzaki!,
                            id: controller.program![index].id,
                            persenn: controller.program![index].persen!,
                            deskripsi: controller.program![index].deskripsi!,
                            file: controller.program![index].file!,
                            gambar: controller.program![index].gambar!,
                            banner: controller.program![index].banner!,
                          );
                        }
                      },
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
