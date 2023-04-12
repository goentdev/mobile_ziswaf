import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:mobile_ziswaf/app/data/providers/muzaki_provider.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/views/ubah_muzakki_page.dart';
import 'package:get/get.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../../ProgramPage/views/detail_transaksi_page.dart';
import '../../controllers/muzakki_page_controller.dart';

class CardListUser extends StatelessWidget {
  final String nama;
  final String nomor;
  final String email;
  final String kategori;
  final String tipe;
  final String? gambar;
  final int id;
  final MuzakkiPageController muzaki;

  const CardListUser({
    super.key,
    required this.nama,
    required this.nomor,
    required this.id,
    required this.email,
    required this.kategori,
    required this.tipe,
    required this.muzaki,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuzakkiPageController());
    return Slidable(
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
                                    style:
                                        textMBold.copyWith(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  await controller.deleteMuzaki(id);
                                  Get.back();
                                  await controller.refreshMuzaki();
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
        SlidableAction(
          label: 'Edit',
          onPressed: (context) {
            showModalBottomSheet(
              isScrollControlled: true,
              enableDrag: true,
              constraints: const BoxConstraints(maxHeight: 470),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              context: context,
              builder: (context) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: neutral30,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: primarySurface,
                                child: gambar!.contains(" ")
                                    ? Text(
                                        gambar![0].toUpperCase() +
                                            gambar!
                                                .split(" ")
                                                .last[0]
                                                .toUpperCase(),
                                        style: textSBold.copyWith(
                                            color: primaryMain),
                                      )
                                    : Text(
                                        gambar![0].toUpperCase(),
                                        style: textSBold.copyWith(
                                            color: primaryMain),
                                      )),
                            const SizedBox(width: 16),
                            Text(
                              nama,
                              style: listTitleBold.copyWith(color: neutral100),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nomor Whatsapp',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: nomor,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: email,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kategori Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: kategori,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tipe Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: tipe,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await controller.deleteMuzaki(id);
                              Get.back();
                              await controller.refreshMuzaki();
                            },
                            child: Container(
                              width: 40,
                              height: 41,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: dangerMain),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/trash.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(() => UbahMuzakki(
                                    nama: nama,
                                    nomor: nomor,
                                    email: email,
                                    kategori: kategori,
                                    tipe: tipe,
                                    id: id,
                                    muzaki: muzaki,
                                  ));
                            },
                            child: Container(
                              width: 310,
                              height: 41,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryMain),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ubah Data',
                                    style: buttonTabsTextBold.copyWith(
                                        color: primaryMain),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
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
          onPressed: (context) {
            showModalBottomSheet(
              isScrollControlled: true,
              enableDrag: true,
              constraints: const BoxConstraints(maxHeight: 470),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              context: context,
              builder: (context) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: neutral30,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: primarySurface,
                                child: gambar!.contains(" ")
                                    ? Text(
                                        gambar![0].toUpperCase() +
                                            gambar!
                                                .split(" ")
                                                .last[0]
                                                .toUpperCase(),
                                        style: textSBold.copyWith(
                                            color: primaryMain),
                                      )
                                    : Text(
                                        gambar![0].toUpperCase(),
                                        style: textSBold.copyWith(
                                            color: primaryMain),
                                      )),
                            const SizedBox(width: 16),
                            Text(
                              nama,
                              style: listTitleBold.copyWith(color: neutral100),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nomor Whatsapp',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: nomor,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: email,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kategori Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: kategori,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: neutral40,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Masukan nomor WhatsApp',
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tipe Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral90),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: tipe,
                        style: captionTextSemiBold.copyWith(color: neutral100),
                        enabled: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintStyle: textMBold.copyWith(color: neutral60),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await controller.deleteMuzaki(id);
                              Get.back();
                              await controller.refreshMuzaki();
                            },
                            child: Container(
                              width: 40,
                              height: 41,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: dangerMain),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/trash.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(() => UbahMuzakki(
                                    nama: nama,
                                    nomor: nomor,
                                    email: email,
                                    kategori: kategori,
                                    tipe: tipe,
                                    id: id,
                                    muzaki: muzaki,
                                  ));
                            },
                            child: Container(
                              width: 310,
                              height: 41,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryMain),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ubah Data',
                                    style: buttonTabsTextBold.copyWith(
                                        color: primaryMain),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
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
                                    style:
                                        textMBold.copyWith(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  await controller.deleteMuzaki(id);
                                  Get.back();
                                  await controller.refreshMuzaki();
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
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 67,
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: neutral30))),
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
                    nomor,
                    style: overlineSemiBold.copyWith(color: neutral70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
