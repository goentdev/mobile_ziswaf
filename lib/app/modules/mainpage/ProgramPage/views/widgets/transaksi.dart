import 'package:flutter/material.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/detail_card.dart';
import 'package:get/get.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../controllers/program_page_controller.dart';

class TransaksiDetail extends StatelessWidget {
  final String judul, tanggalakhir, persenn, deskripsi, file, gambar, banner;
  final int terkumpul, target, target1, target100;
  final int? id, totalTransaksi;
  const TransaksiDetail(
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  style: listItemTitleBold.copyWith(color: neutral100),
                ),
              ),
              Expanded(
                child: GetBuilder<ProgramPageController>(
                  init: ProgramPageController(),
                  initState: (_) {},
                  builder: (_) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.transaksi!.length,
                      itemBuilder: (context, index) {
                        return DetailCard(
                          status: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .konfirmasi,
                          muzakiId: controller
                                  .transaksi![
                                      controller.transaksi!.length - 1 - index]
                                  .muzaki
                                  ?.id ??
                              0,
                          buktifotoTransaksi: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .buktiTransaksi,
                          nomorResi: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .nomorResi,
                          nomorRekening: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .nomorRekening,
                          namaRekening: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .namaRekening,
                          kategori: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .kategori,
                          email: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .muzaki!
                              .email,
                          nomor: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .muzaki!
                              .whatsapp,
                          judul: judul,
                          programId: id,
                          id: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .id,
                          icon: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .muzaki
                              ?.nama,
                          nama: controller
                                  .transaksi![
                                      controller.transaksi!.length - 1 - index]
                                  .muzaki
                                  ?.nama ??
                              '-',
                          bank: controller
                                  .transaksi![
                                      controller.transaksi!.length - 1 - index]
                                  .bank
                                  ?.nama ??
                              '-',
                          nominal: controller
                                  .transaksi?[
                                      controller.transaksi!.length - 1 - index]
                                  .totalTransaksi ??
                              0,
                          waktu: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .createdAt,
                          bankId: controller
                                  .transaksi![
                                      controller.transaksi!.length - 1 - index]
                                  .bank
                                  ?.id ??
                              1,
                          kwitansi: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .kuitansi,
                          sertifikat: controller
                              .transaksi![
                                  controller.transaksi!.length - 1 - index]
                              .sertifikat!
                              .sertifikat
                              .toString(),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
