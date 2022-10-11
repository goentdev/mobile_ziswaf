import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class DetailCard extends StatelessWidget {
  final String icon;
  final String nama;
  final String bank;
  final String nominal;
  final String waktu;

  const DetailCard(
      {super.key,
      required this.icon,
      required this.nama,
      required this.bank,
      required this.nominal,
      required this.waktu});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: primarySurface,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: captionTextBold.copyWith(color: neutral100),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bank,
                    style: overlineSemiBold.copyWith(color: neutral70),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                nominal,
                style: captionTextBold.copyWith(color: secondaryMain),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                waktu,
                style: overlineSemiBold.copyWith(color: neutral60),
              )
            ],
          ),
        ],
      ),
    );
  }
}
