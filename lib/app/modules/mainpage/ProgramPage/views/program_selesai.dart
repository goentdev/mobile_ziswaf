import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/card_dana.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

import '../../../../theme/colors.dart';

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
            'Daftar Program (2)',
            style: listItemTitleBold.copyWith(color: neutral100),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: const [],
          )
        ],
      ),
    );
  }
}
