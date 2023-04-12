import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/tab_bar.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/program_selesai.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/program_berlangsung.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:get/get.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/program_page_controller.dart';

class ProgramPageView extends GetView<ProgramPageController> {
  const ProgramPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final progC = Get.put(ProgramPageController());
    final controller2 = Get.put(ProfileController());
    controller.getPrograms2();
    controller.gettotaldana();
    controller.gettotalberlangsungg();

    return Obx(() => Visibility(
          visible: controller2.user.value!.status == 0,
          replacement: Scaffold(
            backgroundColor: const Color(0xffECF7F4),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.getPrograms();
                controller.gettotalberlangsungg();
                controller.refreshProgram();
                controller.gettotaldana();
              },
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/bagmoney.png',
                          width: 163.26,
                          height: 163.26,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 68),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dana Terkumpul',
                                  style: listTitleSemiBold.copyWith(
                                      color: neutral90)),
                              const SizedBox(
                                height: 2,
                              ),
                              Obx(
                                () => Text(
                                    NumberFormat.currency(
                                      locale: 'id',
                                      name: 'Rp',
                                      decimalDigits: 0,
                                    ).format(progC.totalDana.value!
                                            .totalDanaProgram ??
                                        0),
                                    style: pageTitleBold.copyWith(
                                        color: primaryHover)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 24),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: MyTabBar(
                                  controller: progC.tabController,
                                  tabs: const [
                                    Tab(text: 'Berlangsung'),
                                    Tab(text: 'Selesai'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 26),
                              RefreshIndicator(
                                onRefresh: () async {
                                  controller.getPrograms();
                                },
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: progC.isLoading4.value == false
                                      ? progC.totalBerlangsung.value!.total! > 4
                                          ? progC.totalBerlangsung.value!
                                                  .total! *
                                              170
                                          : 720
                                      : 720,
                                  child: TabBarView(
                                      controller: progC.tabController,
                                      children: const [
                                        ProgramBerlangsung(),
                                        ProgramSudahSelesai(),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Scaffold(
              backgroundColor: const Color(0xffECF7F4),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 91,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/nonaktif.png',
                      width: 288,
                      height: 288,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Akun Anda\nDinonaktifkan',
                      style: h2ExtraBold.copyWith(color: neutral100),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Silahkan hubungi admin untuk mengaktifkan\nakun Anda kembali',
                      style: textLSemibold.copyWith(color: neutral80),
                    ),
                  ),
                ],
              )),
        ));
  }
}




// Scaffold(
//               backgroundColor: const Color(0xffECF7F4),
//               body: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 91,
//                   ),
//                   Center(
//                     child: Image.asset(
//                       'assets/images/nonaktif.png',
//                       width: 288,
//                       height: 288,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16),
//                     child: Text(
//                       'Akun Anda\nDinonaktifkan',
//                       style: h2ExtraBold.copyWith(color: neutral100),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16),
//                     child: Text(
//                       'Silahkan hubungi admin untuk mengaktifkan\nakun Anda kembali',
//                       style: textLSemibold.copyWith(color: neutral80),
//                     ),
//                   ),
//                 ],
//               ))