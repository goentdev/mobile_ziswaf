import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class CardRekening extends StatelessWidget {
  const CardRekening(
      {super.key,
      required this.namaBank,
      required this.nomorRekening,
      required this.namaRekening});
  final String namaBank, nomorRekening, namaRekening;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: Image.asset(
                  'assets/icons/credit.png',
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaBank,
                    style: captionTextSemiBold.copyWith(
                      color: neutral90,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nomorRekening,
                    style: captionTextSemiBold.copyWith(color: neutral80),
                  ),
                  Text(
                    'a.n $namaRekening',
                    style: captionTextSemiBold.copyWith(
                      color: neutral80,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
