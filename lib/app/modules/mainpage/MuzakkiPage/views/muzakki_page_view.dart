import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/tambah_muzakki.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/daftar_badanUsaha.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/daftar_pemerintah.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/daftar_personal.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/tab_bar.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/muzakki_page_controller.dart';

class MuzakkiPageView extends GetView<MuzakkiPageController> {
  const MuzakkiPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuzakkiPageController());
    final controller2 = Get.put(ProfileController());

    return Obx(
      () => Scaffold(
          backgroundColor: const Color(0xffECF7F4),
          body: controller2.user.value!.status == 1
              ? SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/muzaki.png',
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
                              Text('Muzakki terdaftar',
                                  style: listTitleSemiBold.copyWith(
                                      color: neutral90)),
                              const SizedBox(
                                height: 2,
                              ),
                              Obx(
                                () => Text(
                                    '${controller.totalmuzaki.value!.totalMuzaki}',
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
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 44,
                                  padding:
                                      const EdgeInsets.fromLTRB(14, 0, 0, 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: neutral30, width: 1)),
                                  child: TextField(
                                    controller:
                                        controller.searchMuzakkiController,
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
                                        hintStyle: textSRegular.copyWith(
                                            color: neutral60)),
                                    onChanged: (value) {
                                      controller.searchMuzakki(value);
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          color: Colors.white,
                          child: MyTabBar(
                              controller: controller.tabController,
                              tabs: const [
                                Tab(
                                  text: 'Badan Usaha',
                                ),
                                Tab(
                                  text: 'Pemerintah',
                                ),
                                Tab(text: 'Personal'),
                              ]),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 600,
                          child: TabBarView(
                              controller: controller.tabController,
                              children: const [
                                DaftarBadanUsaha(),
                                DaftarPemerintah(),
                                DaftarPersonal(),
                              ]),
                        ),
                      ],
                    ),
                  ]),
                )
              : Center(
                  child: Text('Akun Anda di nonaktifkan'),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: controller2.user.value!.status == 1
              ? FloatingActionButton(
                  backgroundColor: secondaryMain,
                  onPressed: () {
                    Get.to(() => const TambahMuzakki());
                  },
                  child: Image.asset(
                    'assets/images/pluss.png',
                    width: 30,
                  ),
                )
              : const SizedBox()),
    );
  }
}
