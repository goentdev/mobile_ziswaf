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
                  'Daftar Muzakki (${controller.muzaki!.length})',
                  style: listItemTitleBold.copyWith(color: neutral100),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: GetBuilder<MuzakkiPageController>(
                  init: MuzakkiPageController(),
                  initState: (_) {},
                  builder: (_) {
                    return Scrollbar(
                      thumbVisibility: false,
                      controller: controller.scrollController,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          controller.refreshMuzaki();
                        },
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount:
                              controller.searchMuzakkiController.text.isNotEmpty
                                  ? controller.muzakkisOnSearch!.length
                                  : controller.muzaki!.length,
                          itemBuilder: (context, index) {
                            if (controller
                                .searchMuzakkiController.text.isNotEmpty) {
                              return controller.muzaki![index].kategori ==
                                      'Badan Usaha'
                                  ? CardListUser(
                                      nama: controller
                                          .muzakkisOnSearch![index].nama!,
                                      nomor: controller.muzakkisOnSearch![index]
                                          .muzaki!.whatsapp!,
                                      id: controller.muzaki![index].muzaki!.id!,
                                    )
                                  : const SizedBox();
                            } else {
                              return controller.muzaki![index].kategori ==
                                      'Badan Usaha'
                                  ? CardListUser(
                                      nama: controller.muzaki![index].nama!,
                                      nomor: controller
                                          .muzaki![index].muzaki!.whatsapp!,
                                      id: controller.muzaki![index].muzaki!.id!,
                                    )
                                  : const SizedBox();
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 130,
              )
            ],
          ),
        ),
      ),
    );
  }
}
