import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class CardMuzakki extends StatelessWidget {
  final String nama;
  final String nomor;

  const CardMuzakki({
    super.key,
    required this.nama,
    required this.nomor,
  });

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
          color: neutral30,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/ap.png',
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
                nomor,
                style: overlineSemiBold.copyWith(color: neutral70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
