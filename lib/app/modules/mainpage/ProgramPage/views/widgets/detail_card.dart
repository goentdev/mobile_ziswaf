import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/detail_transaksi_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/edit_transaksi_page.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class DetailCard extends StatelessWidget {
  final String? icon;
  final String nama;
  final String bank;
  final int bankId;
  final int? nominal, id, programId, muzakiId;
  final String? waktu;
  final String judul;
  final String? nomor;
  final String? email, kategori, nomorRekening, namaRekening, nomorResi;
  final String? jenisDonasi;
  final String? buktifotoTransaksi;
  final int? nominaldonasi;

  const DetailCard({
    super.key,
    required this.icon,
    required this.nama,
    required this.bank,
    required this.nominal,
    required this.waktu,
    required this.judul,
    required this.nomor,
    required this.email,
    required this.nomorRekening,
    required this.namaRekening,
    required this.nomorResi,
    required this.buktifotoTransaksi,
    this.kategori,
    this.jenisDonasi,
    this.id,
    this.programId,
    this.nominaldonasi,
    this.muzakiId,
    required this.bankId,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramPageController());
    return InkWell(
      onTap: () async {
        Get.to(() => DetailTransaksi(
            bankId: bankId,
            muzakiId: muzakiId!,
            transaksiId: id!,
            whatsapp: nomor!,
            bankNama: bank,
            fotobuktiTransaksi: buktifotoTransaksi,
            nomoResi: nomorResi,
            programId: programId,
            id: id,
            buktifotoTransaksi: buktifotoTransaksi,
            totalNominalTransaksi: nominal,
            tanggaltransfer: waktu,
            judul: judul,
            nama: nama,
            nomor: nomor,
            email: email,
            kategori: kategori,
            bank: bank,
            nomorRekening: nomorRekening,
            namaRekening: namaRekening,
            nomorResi: nomorResi));
        await controller.getAlokasiDana(id: id);
        await controller.totaltransaksi(id: programId);
      },
      child: Slidable(
        enabled: true,
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            label: 'Hapus',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    insetPadding: const EdgeInsets.all(10),
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 308,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 48),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                              width: 75,
                              child: CircleAvatar(
                                backgroundColor: const Color(0XffFEF7EC),
                                child: Image.asset(
                                  'assets/icons/iconseru.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Yakin Ingin Menghapus Data?',
                              style: listItemTitleBlack.copyWith(
                                color: neutral100,
                              ),
                            ),
                            const SizedBox(height: 48),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 24),
                                      height: 41,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          width: 1,
                                          color: neutral40,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Batal',
                                        style: textMBold.copyWith(
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await controller.deleteTransaksi(id);
                                      Get.back();
                                      await controller.getTransaksis(
                                          id: programId);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 24),
                                      height: 41,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: dangerMain,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Hapus',
                                        style: textMBold.copyWith(
                                            color: dangerMain),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icons.remove_circle,
            flex: 5,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            label: 'Edit',
            onPressed: (context) async {
              await controller.getAlokasiDana(id: id);
              Get.to(() => EditTransaksiPage(
                    fotobuktiTransaksi: buktifotoTransaksi,
                    bankNama: bank,
                    namaRekening: namaRekening,
                    nomoResi: nomorResi,
                    nomorRekening: nomorRekening,
                    whatsapp: nomor!,
                    judul: judul,
                    nama: nama,
                    nomor: nomor,
                    transaksiId: id!,
                    programId: programId!,
                    email: email!,
                    kategori: kategori!,
                    muzakiId: muzakiId!,
                    bankId: bankId,
                  ));
            },
            icon: Icons.edit_note_rounded,
            flex: 5,
            backgroundColor: primaryMain,
            foregroundColor: Colors.white,
          ),
        ]),
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            label: 'Edit',
            onPressed: (context) async {
              await controller.getAlokasiDana(id: id);
              Get.to(() => EditTransaksiPage(
                    fotobuktiTransaksi: buktifotoTransaksi,
                    bankNama: bank,
                    namaRekening: namaRekening,
                    nomoResi: nomorResi,
                    nomorRekening: nomorRekening,
                    whatsapp: nomor!,
                    judul: judul,
                    nama: nama,
                    nomor: nomor,
                    transaksiId: id!,
                    programId: programId!,
                    email: email!,
                    kategori: kategori!,
                    muzakiId: muzakiId!,
                    bankId: bankId,
                  ));
            },
            icon: Icons.edit_note_rounded,
            flex: 5,
            backgroundColor: primaryMain,
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            label: 'Hapus',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    insetPadding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      height: 308,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 48),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 75,
                            width: 75,
                            child: CircleAvatar(
                              backgroundColor: const Color(0XffFEF7EC),
                              child: Image.asset(
                                'assets/icons/iconseru.png',
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Yakin Ingin Menghapus Data?',
                            style: listItemTitleBlack.copyWith(
                              color: neutral100,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Row(
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 24),
                                    height: 41,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                        width: 1,
                                        color: neutral40,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Batal',
                                      style: textMBold.copyWith(
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () async {
                                    await controller.deleteTransaksi(id);
                                    Get.back();
                                    await controller.getTransaksis(
                                        id: programId);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 24),
                                    height: 41,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: dangerMain,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Hapus',
                                      style:
                                          textMBold.copyWith(color: dangerMain),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icons.remove_circle,
            flex: 5,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ]),
        child: Container(
          width: double.infinity,
          height: 74,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: neutral30,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: primarySurface,
                              child: icon!.contains(" ")
                                  ? Text(
                                      icon![0].toUpperCase() +
                                          icon!
                                              .split(" ")
                                              .last[0]
                                              .toUpperCase(),
                                      style: textSBold.copyWith(
                                          color: primaryMain),
                                    )
                                  : Text(
                                      icon![0].toUpperCase(),
                                      style: textSBold.copyWith(
                                          color: primaryMain),
                                    )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nama,
                                  style: captionTextBold.copyWith(
                                      color: neutral100),
                                ),
                                const SizedBox(height: 6),
                                Flexible(
                                  child: Text(
                                    bank,
                                    overflow: TextOverflow.visible,
                                    style: overlineSemiBold.copyWith(
                                        color: neutral70),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            name: 'Rp',
                            decimalDigits: 0,
                          ).format(nominal),
                          style: captionTextBold.copyWith(color: secondaryMain),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          Jiffy(waktu).fromNow(),
                          style: overlineSemiBold.copyWith(color: neutral60),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
