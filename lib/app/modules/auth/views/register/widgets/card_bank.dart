import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class CardBank extends StatelessWidget {
  const CardBank(
      {super.key,
      required this.bank,
      required this.gambar,
      required this.onTap});

  final String bank;
  final String gambar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: neutral30,
              ),
              child: Image.network(
                'https://ziswaf-server.smarteschool.net$gambar',
                height: 40,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              bank,
              style: textMBold.copyWith(color: neutral100),
            ),
          ],
        ),
      ),
    );
  }
}
