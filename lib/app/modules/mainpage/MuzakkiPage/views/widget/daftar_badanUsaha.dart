import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/controllers/muzakki_page_controller.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/card_list_user.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class DaftarBadanUsaha extends StatelessWidget {
  const DaftarBadanUsaha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuzakkiPageController());
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Obx(
          () => Visibility(
            visible: controller.isLoading.isFalse,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 200,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daftar Muzakki (${controller.muzaki.length})',
                    style: listItemTitleBold.copyWith(color: neutral100),
                  ),
                ),
                GetBuilder<MuzakkiPageController>(
                  init: MuzakkiPageController(),
                  initState: (_) {},
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.searchMuzakkiController.text.isNotEmpty
                              ? controller.muzakkisOnSearch.length
                              : controller.muzaki.length,
                      itemBuilder: (context, index) {
                        if (controller
                            .searchMuzakkiController.text.isNotEmpty) {
                          return CardListUser(
                            nama: controller.muzakkisOnSearch[index].nama!,
                            nomor: controller
                                .muzakkisOnSearch[index].muzaki!.whatsapp!,
                          );
                        } else {
                          return CardListUser(
                            nama: controller.muzaki[index].nama!,
                            nomor: controller.muzaki[index].muzaki!.whatsapp!,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
