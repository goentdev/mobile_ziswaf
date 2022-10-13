import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../../ProgramPage/views/detail_transaksi_page.dart';

class CardListUser extends StatelessWidget {
  final String nama;
  final String nomor;

  const CardListUser({
    super.key,
    required this.nama,
    required this.nomor,
  });

  @override
  Widget build(BuildContext context) {
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
                                onTap: () {
                                  Navigator.pop(context);
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
            Get.to(const DetailTransaksi());
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
            Get.to(const DetailTransaksi());
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
                                onTap: () {
                                  Navigator.pop(context);
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
        ),
      ),
    );
  }
}
