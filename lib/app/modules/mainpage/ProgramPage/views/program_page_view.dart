import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

import '../controllers/program_page_controller.dart';

class ProgramPageView extends GetView<ProgramPageController> {
  const ProgramPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar Program (${3})',
                          style: listItemTitleBold.copyWith(color: neutral100),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: const [
                            CardDana(
                                judul: 'Sedekah Bangunan Infrastruktur',
                                terkumpul: 500000,
                                target: 1100000,
                                tanggalakhir: '2022-10-10 10:22:00',
                                muzakki: 10),
                            CardDana(
                                judul: 'Infaq Beras untuk Pantiasuhan',
                                terkumpul: 500000,
                                target: 2000000,
                                tanggalakhir: '2022-10-10 10:22:00',
                                muzakki: 10),
                            CardDana(
                                judul: 'Gerakan Bantu Kesehatan Mental',
                                terkumpul: 500000,
                                target: 1500000,
                                tanggalakhir: '2022-10-10 10:22:00',
                                muzakki: 10),
                            CardDana(
                                judul: 'Foodtruck Gratis untuk Dhuafa',
                                terkumpul: 500000,
                                target: 1100000,
                                tanggalakhir: '2022-10-10 10:22:00',
                                muzakki: 10),
                          ],
                        )
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
