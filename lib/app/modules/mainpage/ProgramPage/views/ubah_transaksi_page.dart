import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/controllers/muzakki_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/ubah_transaksi_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_Muzakki.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../MuzakkiPage/views/tambah_muzakki.dart';

class UbahTransaksiPage extends StatelessWidget {
  final String judul;
  final int programId;
  const UbahTransaksiPage(
      {super.key, required this.judul, required this.programId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuzakkiPageController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Pilih Muzakki',
            style: listTitleBold.copyWith(color: neutral90),
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
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: neutral40,
                ),
                child: TextField(
                  controller: controller.searchMuzakkiController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari',
                  ),
                  onChanged: (value) {
                    controller.searchMuzakki(value);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daftar Muzaki (${controller.totalmuzaki.value!.totalMuzaki})',
                    style: listItemTitleBold.copyWith(color: neutral100),
                  ),
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
                      itemCount:
                          controller.searchMuzakkiController.text.isNotEmpty
                              ? controller.muzakkisOnSearch!.length
                              : controller.muzaki!.length,
                      itemBuilder: (context, index) {
                        if (controller
                            .searchMuzakkiController.text.isNotEmpty) {
                          return CardMuzakki(
                            nama: controller.muzakkisOnSearch![index].nama!,
                            nomor: controller
                                .muzakkisOnSearch![index].muzaki!.whatsapp!,
                            judul: judul,
                            gambar: controller.muzaki![index].nama!,
                            id: controller.muzaki![index].muzaki!.id!,
                            programId: programId,
                            email: controller.muzaki![index].muzaki!.email!,
                            kategori: controller.muzaki![index].kategori!,
                          );
                        } else {
                          return CardMuzakki(
                            gambar: controller.muzaki![index].nama,
                            nama: controller.muzaki![index].nama!,
                            nomor: controller.muzaki![index].muzaki!.whatsapp!,
                            judul: judul,
                            id: controller.muzaki![index].muzaki!.id!,
                            programId: programId,
                            email: controller.muzaki![index].muzaki!.email!,
                            kategori: controller.muzaki![index].kategori!,
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
            Get.to(() => const TambahMuzakki());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/addu.png',
                width: 16,
                height: 13.6,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Tambah Muzakki Baru',
                style: textMBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
