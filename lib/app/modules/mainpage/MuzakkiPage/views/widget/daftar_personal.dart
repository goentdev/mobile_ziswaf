import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/card_list_user.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../../ProgramPage/controllers/ubah_transaksi_controller.dart';

class DaftarPersonal extends StatelessWidget {
  const DaftarPersonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UbahTransakiController());
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Muzakki (${controller.users.length})',
                style: listItemTitleBold.copyWith(color: neutral100),
              ),
            ),
            GetBuilder<UbahTransakiController>(
              init: UbahTransakiController(),
              initState: (_) {},
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.searchMuzakkiController.text.isNotEmpty
                      ? controller.muzakkisOnSearch.length
                      : controller.users.length,
                  itemBuilder: (context, index) {
                    if (controller.searchMuzakkiController.text.isNotEmpty) {
                      return CardListUser(
                        nama: controller.muzakkisOnSearch[index].nama!,
                        nomor: controller.muzakkisOnSearch[index].nomor!,
                      );
                    } else {
                      return CardListUser(
                        nama: controller.users[index].nama!,
                        nomor: controller.users[index].nomor!,
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
