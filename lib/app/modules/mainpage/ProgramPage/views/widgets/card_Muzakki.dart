import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/tambah_transaksi_page.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class CardMuzakki extends StatelessWidget {
  final String nama;
  final String? nomor;
  final String judul, kategori, email;
  final int id, programId;
  final String? gambar;

  const CardMuzakki({
    super.key,
    required this.nama,
    required this.nomor,
    required this.judul,
    required this.gambar,
    required this.id,
    required this.programId,
    required this.kategori,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => TambahTransaksi(
              judul: judul,
              nama: nama,
              nomor: nomor,
              id: id,
              programId: programId,
              email: email,
              kategori: kategori,
            ));
      },
      child: Container(
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
            CircleAvatar(
                backgroundColor: primarySurface,
                child: Text(
                  gambar![0].trimRight().toUpperCase() +
                      gambar![2].trimRight().toUpperCase(),
                  style: textSBold.copyWith(color: primaryMain),
                )),
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
                  nomor!,
                  style: overlineSemiBold.copyWith(color: neutral70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
