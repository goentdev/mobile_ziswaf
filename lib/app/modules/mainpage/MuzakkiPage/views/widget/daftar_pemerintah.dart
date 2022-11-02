import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/card_list_user.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../../ProgramPage/controllers/ubah_transaksi_controller.dart';
import '../../controllers/muzakki_page_controller.dart';

class DaftarPemerintah extends StatelessWidget {
  const DaftarPemerintah({
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
                  'Daftar Muzakki (${controller.muzakipemerintah!.length})',
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
                          itemCount: controller
                                  .searchMuzakkiController.text.isNotEmpty
                              ? controller.muzakkisOnSearchPemerintah!.length
                              : controller.muzakipemerintah!.length,
                          itemBuilder: (context, index) {
                            if (controller
                                .searchMuzakkiController.text.isNotEmpty) {
                              return controller
                                          .muzakipemerintah![index].kategori ==
                                      'Pemerintah'
                                  ? CardListUser(
                                      nama: controller
                                          .muzakkisOnSearchPemerintah![index]
                                          .nama!,
                                      nomor: controller
                                          .muzakkisOnSearchPemerintah![index]
                                          .muzaki!
                                          .whatsapp!,
                                      id: controller
                                          .muzakipemerintah![index].muzaki!.id!,
                                      email: controller.muzakipemerintah![index]
                                          .muzaki!.email!,
                                      kategori: controller
                                          .muzakipemerintah![index].kategori!,
                                      tipe: controller
                                          .muzakipemerintah![index].tipe!,
                                      muzaki: controller,
                                    )
                                  : const SizedBox();
                            } else {
                              return controller
                                          .muzakipemerintah![index].kategori ==
                                      'Pemerintah'
                                  ? CardListUser(
                                      nama: controller
                                          .muzakipemerintah![index].nama!,
                                      nomor: controller.muzakipemerintah![index]
                                          .muzaki!.whatsapp!,
                                      id: controller
                                          .muzakipemerintah![index].muzaki!.id!,
                                      email: controller.muzakipemerintah![index]
                                          .muzaki!.email!,
                                      kategori: controller
                                          .muzakipemerintah![index].kategori!,
                                      tipe: controller
                                          .muzakipemerintah![index].tipe!,
                                      muzaki: controller,
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
