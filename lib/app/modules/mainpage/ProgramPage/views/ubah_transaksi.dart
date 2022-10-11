import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/ubah_transaksi_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_user.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class UbahTransaksiPage extends StatelessWidget {
  final String judul;
  const UbahTransaksiPage({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UbahTransakiController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            judul,
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
          )),
      body: Obx(
        () => Container(
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
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.searchMuzakkiController.text.isNotEmpty
                      ? controller.muzakkisOnSearch.length
                      : controller.users.length,
                  itemBuilder: (context, index) {
                    if (controller.searchMuzakkiController.text.isNotEmpty) {
                      return CardMuzakki(
                        nama: controller.muzakkisOnSearch[index].nama!,
                        nomor: controller.muzakkisOnSearch[index].nomor!,
                      );
                    } else {
                      return CardMuzakki(
                        nama: controller.users[index].nama!,
                        nomor: controller.users[index].nomor!,
                      );
                    }
                  },
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
          onPressed: () async {},
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
