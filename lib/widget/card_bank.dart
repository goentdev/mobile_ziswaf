import 'package:flutter/material.dart';
import '../theme.dart';

class CardBank extends StatelessWidget {
  const CardBank({super.key, required this.bank, required this.gambar});

  final String bank;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: neutral30,
              ),
              child: Image.asset(
                gambar,
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
