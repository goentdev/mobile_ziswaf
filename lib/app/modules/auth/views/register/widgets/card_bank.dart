import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class CardBank extends StatelessWidget {
  const CardBank(
      {super.key,
      required this.bank,
      required this.gambar,
      required this.onTap,
      required this.id});

  final String bank;
  final int id;
  final String gambar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: neutral30,
                ),
                child: Image.asset(
                  'assets/icons/target.png',
                  height: 30,
                  width: 30,
                )),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Text(
                bank,
                overflow: TextOverflow.visible,
                style: textMBold.copyWith(color: neutral100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
