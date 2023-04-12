import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/utils.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/controllers/muzakki_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/tambah_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_showmdal_muzakki.dart';
import 'package:get/get.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import 'card_Muzakki.dart';

class CardMuzakkiEdit extends StatelessWidget {
  final String nama;
  final String? nomor,
      bank,
      nomorRekening,
      namaRekening,
      nomorResi,
      buktifototransfer;
  final String judul;
  final String? gambar;
  final int id, programId, transaksiId, bankId;

  const CardMuzakkiEdit({
    super.key,
    required this.nama,
    required this.nomor,
    required this.judul,
    required this.gambar,
    required this.id,
    required this.programId,
    required this.transaksiId,
    required this.bank,
    required this.nomorRekening,
    required this.namaRekening,
    required this.nomorResi,
    required this.buktifototransfer,
    required this.bankId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuzakkiPageController());
    final controller2 = Get.put(ProgramPageController());

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.8,
                child: Scaffold(
                  body: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: neutral30,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              const SizedBox(height: 14),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Pilih Muzaki',
                                  style: textMBold.copyWith(color: neutral100)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.fromLTRB(14, 0, 0, 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: neutral30, width: 1)),
                            child: TextField(
                              controller: controller.searchMuzakkiController2,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: neutral60,
                                    size: 20,
                                  ),
                                  hintText: 'Cari Muzakki',
                                  hintStyle:
                                      textSRegular.copyWith(color: neutral60)),
                              onChanged: (value) {
                                controller.searchMuzakki(value);
                              },
                            ),
                          ),
                          GetBuilder<MuzakkiPageController>(
                            init: MuzakkiPageController(),
                            initState: (_) {},
                            builder: (_) {
                              return Scrollbar(
                                thumbVisibility: true,
                                controller: controller.scrollController,
                                child: ListView.builder(
                                  controller: controller.scrollController,
                                  shrinkWrap: true,
                                  itemCount: controller.searchMuzakkiController2
                                          .text.isNotEmpty
                                      ? controller.muzakkisOnSearch!.length
                                      : controller.muzaki!.length,
                                  itemBuilder: (context, index) {
                                    if (controller.searchMuzakkiController2.text
                                        .isNotEmpty) {
                                      return CardShowModalMuzakki(
                                        buktifotoTransaksi: buktifototransfer,
                                        bankNama: bank,
                                        namaRekening: namaRekening,
                                        nomoResi: nomorResi,
                                        nomorRekening: nomorRekening,
                                        transaksiId: transaksiId,
                                        email: controller
                                            .muzakkisOnSearch![index]
                                            .muzaki!
                                            .email!,
                                        kategori: controller
                                            .muzakkisOnSearch![index].kategori!,
                                        whatsapp: controller
                                            .muzakkisOnSearch![index]
                                            .muzaki!
                                            .whatsapp!,
                                        muzakiId: controller
                                            .muzakkisOnSearch![index].muzakiId!,
                                        programId: programId,
                                        nama: controller
                                            .muzakkisOnSearch![index].nama!,
                                        nomor: controller
                                            .muzakkisOnSearch![index]
                                            .muzaki!
                                            .whatsapp!,
                                        judul: judul,
                                        gambar: controller.muzaki![index].nama!,
                                        bankId: bankId,
                                      );
                                    } else {
                                      return CardShowModalMuzakki(
                                        buktifotoTransaksi: buktifototransfer,
                                        bankNama: bank,
                                        namaRekening: namaRekening,
                                        nomoResi: nomorResi,
                                        nomorRekening: nomorRekening,
                                        transaksiId: transaksiId,
                                        email: controller
                                            .muzaki![index].muzaki!.email!,
                                        kategori:
                                            controller.muzaki![index].kategori!,
                                        whatsapp: controller
                                            .muzaki![index].muzaki!.whatsapp!,
                                        muzakiId:
                                            controller.muzaki![index].muzakiId!,
                                        programId: programId,
                                        gambar: controller.muzaki![index].nama,
                                        nama: controller.muzaki![index].nama!,
                                        nomor: controller
                                            .muzaki![index].muzaki!.whatsapp!,
                                        judul: judul,
                                        bankId: bankId,
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        width: double.infinity,
        height: 74,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: neutral30,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: primarySurface,
                        child: gambar!.contains(" ")
                            ? Text(
                                gambar![0].toUpperCase() +
                                    gambar!.split(" ").last[0].toUpperCase(),
                                style: textSBold.copyWith(color: primaryMain),
                              )
                            : Text(
                                gambar![0].toUpperCase(),
                                style: textSBold.copyWith(color: primaryMain),
                              )),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: captionTextBold.copyWith(color: neutral100),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          nomor!,
                          style: overlineSemiBold.copyWith(color: neutral70),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                      color: neutral60,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
