import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DetailCard extends StatelessWidget {
  final String icon;
  final String nama;
  final String bank;
  final String nominal;
  final String waktu;

  const DetailCard(
      {super.key,
      required this.icon,
      required this.nama,
      required this.bank,
      required this.nominal,
      required this.waktu});

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
          onPressed: (context) {},
          icon: Icons.edit_note_rounded,
          flex: 5,
          backgroundColor: primaryMain,
          foregroundColor: Colors.white,
        ),
      ]),
      endActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          label: 'Edit',
          onPressed: (context) {},
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
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
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
                        bank,
                        style: overlineSemiBold.copyWith(color: neutral70),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    nominal,
                    style: captionTextBold.copyWith(color: secondaryMain),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    waktu,
                    style: overlineSemiBold.copyWith(color: neutral60),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
