import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class ProgramSudahSelesai extends StatelessWidget {
  const ProgramSudahSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Program (3)',
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
                  tanggalakhir: '2022-12-12 10:22:00',
                  muzakki: 10),
            ],
          )
        ],
      ),
    );
  }
}
