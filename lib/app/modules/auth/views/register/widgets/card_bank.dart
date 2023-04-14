import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class CardBank extends StatelessWidget {
  const CardBank(
      {super.key,
      required this.bank,
      required this.gambar,
      required this.onTap,
      required this.id,
      this.norekening,
      this.namaRekening});

  final String bank;
  final int id;
  final String gambar;
  final VoidCallback onTap;
  final String? norekening;
  final String? namaRekening;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets$gambar'),
                  )),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bank,
                        overflow: TextOverflow.visible,
                        style: textMBold.copyWith(color: neutral100),
                      ),
                      Text(
                        '$norekening  A/N  $namaRekening ',
                        style: textMRegular.copyWith(color: neutral70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
