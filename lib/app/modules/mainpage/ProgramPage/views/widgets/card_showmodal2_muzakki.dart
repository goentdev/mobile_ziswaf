import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/edit_transaksi2_page.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../edit_transaksi_page.dart';

class CardShowModalMuzakki2 extends StatelessWidget {
  final String nama;
  final String? nomor;
  final String judul, email, kategori, whatsapp;
  final String? gambar,
      bankNama,
      namRekening,
      nomorResi,
      nomorRekening,
      buktifotoTransaksi;
  final int muzakiId, programId, transaksiId;

  const CardShowModalMuzakki2(
      {super.key,
      required this.nama,
      required this.nomor,
      required this.judul,
      required this.gambar,
      required this.muzakiId,
      required this.programId,
      required this.email,
      required this.kategori,
      required this.whatsapp,
      required this.transaksiId,
      required this.bankNama,
      required this.namRekening,
      required this.nomorResi,
      required this.nomorRekening,
      required this.buktifotoTransaksi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(() => EditTransaksiPage(
              fotobuktiTransaksi: buktifotoTransaksi,
              bankNama: bankNama,
              namaRekening: namRekening,
              nomoResi: nomorResi,
              nomorRekening: nomorRekening,
              email: email,
              kategori: kategori,
              whatsapp: whatsapp,
              judul: judul,
              nama: nama,
              nomor: nomor,
              muzakiId: muzakiId,
              transaksiId: transaksiId,
              programId: programId,
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
                child: gambar!.contains(" ")
                    ? Text(
                        gambar![0].toUpperCase() +
                            gambar!.split(" ").last[0].toUpperCase(),
                        style: textSBold.copyWith(color: primaryMain),
                      )
                    : Text(
                        gambar![0].toUpperCase(),
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