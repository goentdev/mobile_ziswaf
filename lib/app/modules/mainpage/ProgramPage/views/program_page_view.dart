import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/widget/tab_bar.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/program_belum.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/program_sudah.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

import '../controllers/program_page_controller.dart';

class ProgramPageView extends GetView<ProgramPageController> {
  const ProgramPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProgC = Get.put(ProgramPageController());
    return Scaffold(
        backgroundColor: const Color(0xffECF7F4),
        body: SingleChildScrollView(
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
                            style:
                                listTitleSemiBold.copyWith(color: neutral90)),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                            NumberFormat.currency(
                              locale: 'id',
                              name: 'Rp',
                              decimalDigits: 0,
                            ).format(15000000),
                            style: pageTitleBold.copyWith(color: primaryHover)),
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
                          color: Colors.white,
                          child: MyTabBar(
                            controller: ProgC.tabController,
                            tabs: const [
                              Tab(text: 'Berlangsung'),
                              Tab(text: 'Selesai'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        SizedBox(
                          width: double.maxFinite,
                          height: 720,
                          child: TabBarView(
                              controller: ProgC.tabController,
                              children: const [
                                ProgramSudahSelesai(),
                                ProgramBelumSelesai(),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
