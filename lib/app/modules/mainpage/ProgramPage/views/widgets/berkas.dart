import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/views/widgets/viewer.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';
import '../../controllers/program_page_controller.dart';

class Berkas extends StatelessWidget {
  final String judul, tanggalakhir, persenn, deskripsi, file, gambar, banner;
  final int terkumpul, target, target1, target100;
  final int? id, totalTransaksi;
  const Berkas(
      {super.key,
      required this.judul,
      required this.tanggalakhir,
      required this.persenn,
      required this.deskripsi,
      required this.file,
      required this.gambar,
      required this.banner,
      required this.terkumpul,
      required this.target,
      required this.target1,
      required this.target100,
      this.id,
      this.totalTransaksi});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramPageController());
    String filename = file;

    filename = filename.split("/")[7];
    filename = filename.substring(0, filename.indexOf('?'));

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(() => Visibility(
            visible: controller.isLoading.isFalse,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 50,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Berkas',
                    style: listItemTitleBold.copyWith(
                        fontWeight: extraBold, color: neutral100),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Proposal Program',
                    textAlign: TextAlign.start,
                    style: textSSemibold.copyWith(color: neutral90),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Viewer(
                      link: file,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primarySurface,
                        border: Border.all(width: 1, color: neutral30)),
                    padding: const EdgeInsets.all(16),
                    height: 62,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15,
                                child: Image.asset(
                                  'assets/icons/file.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  filename,
                                  overflow: TextOverflow.visible,
                                  style: captionTextBold.copyWith(
                                      color: neutral100),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: primaryMain,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gambar Poster',
                    textAlign: TextAlign.start,
                    style: textSSemibold.copyWith(color: neutral90),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PhotoView(
                      imageProvider: NetworkImage(gambar),
                    ));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(gambar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
