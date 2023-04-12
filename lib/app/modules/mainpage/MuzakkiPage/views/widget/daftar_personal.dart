import 'package:flutter/material.dart';

import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/card_list_user.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../../ProgramPage/controllers/ubah_transaksi_controller.dart';
import '../../controllers/muzakki_page_controller.dart';
import 'package:get/get.dart';

class DaftarPersonal extends StatelessWidget {
  const DaftarPersonal({
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
                  'Daftar Muzakki (${controller.muzakipersonal!.length})',
                  style: listItemTitleBold.copyWith(color: neutral100),
                ),
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
                                  ? controller.muzakkisOnSearchPersonal!.length
                                  : controller.muzakipersonal!.length,
                          itemBuilder: (context, index) {
                            if (controller
                                .searchMuzakkiController.text.isNotEmpty) {
                              return controller
                                          .muzakipersonal![index].kategori ==
                                      'Personal'
                                  ? CardListUser(
                                      gambar: controller
                                          .muzakipersonal![index].nama!,
                                      nama: controller
                                          .muzakkisOnSearchPersonal![index]
                                          .nama!,
                                      nomor: controller
                                          .muzakkisOnSearchPersonal![index]
                                          .muzaki!
                                          .whatsapp!,
                                      id: controller
                                          .muzakipersonal![index].muzaki!.id!,
                                      email: controller.muzakipersonal![index]
                                          .muzaki!.email!,
                                      kategori: controller
                                          .muzakipersonal![index].kategori!,
                                      tipe: controller
                                          .muzakipersonal![index].tipe!,
                                      muzaki: controller,
                                    )
                                  : const SizedBox();
                            } else {
                              return controller
                                          .muzakipersonal![index].kategori ==
                                      'Personal'
                                  ? CardListUser(
                                      gambar: controller
                                          .muzakipersonal![index].nama!,
                                      nama: controller
                                          .muzakipersonal![index].nama!,
                                      nomor: controller.muzakipersonal![index]
                                          .muzaki!.whatsapp!,
                                      id: controller
                                          .muzakipersonal![index].muzaki!.id!,
                                      email: controller.muzakipersonal![index]
                                          .muzaki!.email!,
                                      kategori: controller
                                          .muzakipersonal![index].kategori!,
                                      tipe: controller
                                          .muzakipersonal![index].tipe!,
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
