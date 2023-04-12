import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:photo_view/photo_view.dart';

class IdentityController extends GetxController {
  final ImagePicker picker = ImagePicker();
  XFile? identityImage;
  late TextEditingController identityNumberController;
  late GlobalKey<FormState> identFormKey;

  List<String> identityType = ['KTP', 'SIM', 'PASSPORT'].obs;
  List<String> tingkatRelawan = ['Madya', 'Dewasa', 'Utama'].obs;
  List<String> kategoriRelawan = ['Perorangan', 'Lembaga'].obs;
  RxString selectedType = ''.obs;
  RxString selectedTingkat = ''.obs;
  RxString selectedKategori = ''.obs;
  RxBool delete = true.obs;

  @override
  void onInit() {
    identityNumberController = TextEditingController();
    identFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void deletee() {
    delete.value = !delete.value;
  }

  pickFromCamera(context) async {
    identityImage = await picker.pickImage(source: ImageSource.camera);
    Get.back();
    showModalBottomSheet(
      isScrollControlled: true,
      constraints: const BoxConstraints(maxHeight: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: neutral30,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      Stack(
                        children: [
                          PhotoView(
                            imageProvider: FileImage(File(identityImage!.path)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16, top: 40),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: primaryMain,
                                size: 24,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 245,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: neutral50),
                        image: DecorationImage(
                            image: FileImage(File(identityImage!.path)),
                            fit: BoxFit.contain)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Yakin ingin mengunggah ?',
                  style: titleTextBold.copyWith(color: neutral80),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            constraints: const BoxConstraints(maxHeight: 170),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 5,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: neutral30,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      'Unggah Bukti Transfer',
                                      style: titleTextBold.copyWith(
                                          color: neutral100),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pickFromCamera(context);
                                          },
                                          child: SizedBox(
                                            height: 86,
                                            width: 163,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/camera.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Foto dari kamera',
                                                  style: captionTextSemiBold
                                                      .copyWith(
                                                    color: neutral80,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickFromGallery(context);
                                          },
                                          child: SizedBox(
                                            height: 86,
                                            width: 163,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/gallery.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Pilih dari galeri',
                                                  style: captionTextSemiBold
                                                      .copyWith(
                                                    color: neutral80,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: primaryMain,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            'Pilih Foto Lain',
                            style: textMBold.copyWith(color: primaryMain),
                          )),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          update();
                          Get.back();
                          deletee();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryMain,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            'Unggah',
                            style: textMBold.copyWith(color: Colors.white),
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
  }

  pickFromGallery(context) async {
    identityImage = await picker.pickImage(source: ImageSource.gallery);
    Get.back();
    showModalBottomSheet(
      isScrollControlled: true,
      constraints: const BoxConstraints(maxHeight: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: neutral30,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Stack(
                      children: [
                        PhotoView(
                          imageProvider: FileImage(
                            File(identityImage!.path),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, top: 40),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: primaryMain,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ));
                  },
                  child: Container(
                    height: 245,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: neutral50),
                        image: DecorationImage(
                            image: FileImage(File(identityImage!.path)),
                            fit: BoxFit.contain)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Yakin ingin mengunggah ?',
                  style: titleTextBold.copyWith(color: neutral80),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            constraints: const BoxConstraints(maxHeight: 170),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 5,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: neutral30,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      'Unggah Bukti Transfer',
                                      style: titleTextBold.copyWith(
                                          color: neutral100),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pickFromCamera(context);
                                          },
                                          child: SizedBox(
                                            height: 86,
                                            width: 163,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/camera.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Foto dari kamera',
                                                  style: captionTextSemiBold
                                                      .copyWith(
                                                    color: neutral80,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickFromGallery(context);
                                          },
                                          child: SizedBox(
                                            height: 86,
                                            width: 163,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/gallery.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Pilih dari galeri',
                                                  style: captionTextSemiBold
                                                      .copyWith(
                                                    color: neutral80,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: primaryMain,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            'Pilih Foto Lain',
                            style: textMBold.copyWith(color: primaryMain),
                          )),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          update();
                          Get.back();
                          deletee();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryMain,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            'Unggah',
                            style: textMBold.copyWith(color: Colors.white),
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
  }
}
