import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/add_foto_widget.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../../../auth/views/register/widgets/change_foto_widget.dart';

class ChangeIdentityPage extends StatelessWidget {
  const ChangeIdentityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityController());
    final profileC = Get.put(ProfileController());
    controller.identityNumberController.text =
        profileC.user.value!.nomorKartuIdentitas.toString();
    controller.selectedType.value =
        profileC.user.value!.jenisKartuIdentitas!.toUpperCase();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 16,
          ),
        ),
        title: Text(
          'Masukan Kartu Identitas Diri',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Jenis Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.identityType.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Obx(
                        () => Text(
                          controller.identityType[index],
                          style: captionTextSemiBold.copyWith(color: neutral80),
                        ),
                      ),
                      trailing: Obx(
                        () => Radio<String>(
                          activeColor: primaryMain,
                          value: controller.identityType[index],
                          groupValue: controller.selectedType.toUpperCase(),
                          onChanged: (value) {
                            controller.selectedType.value = value!;
                            controller.update();
                          },
                        ),
                      ),
                    ),
                    Divider(
                      color: neutral30,
                      thickness: 1,
                      height: 8,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controller.identityNumberController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: neutral30, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Masukkan nomor kartu identitas',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Foto Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GetBuilder(
                init: IdentityController(),
                builder: (controller) => profileC
                            .user.value!.fotoKartuIdentitas ==
                        null
                    ? AddPhotoButton(
                        ontap: () {
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
                                      'Unggah foto kartu identitas',
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
                                            controller.pickFromCamera(context);
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
                                            controller.pickFromGallery(context);
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
                      )
                    : controller.identityImage != null
                        ? Obx(
                            () => controller.delete.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              image: DecorationImage(
                                                image: FileImage(File(controller
                                                    .identityImage!.path)),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -1.0,
                                            right: -1.0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.deletee();
                                              },
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.red,
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : AddPhotoButton(
                                    ontap: () {
                                      showModalBottomSheet(
                                        constraints: const BoxConstraints(
                                            maxHeight: 170),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 16, 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 10),
                                                Container(
                                                  height: 5,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: neutral30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .pickFromCamera(
                                                                context);
                                                      },
                                                      child: SizedBox(
                                                        height: 86,
                                                        width: 163,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/icons/camera.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(
                                                              'Foto dari kamera',
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral80,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .pickFromGallery(
                                                                context);
                                                      },
                                                      child: SizedBox(
                                                        height: 86,
                                                        width: 163,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/icons/gallery.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(
                                                              'Pilih dari galeri',
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral80,
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
                                  ),
                          )
                        : Obx(
                            () => controller.delete.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              image: DecorationImage(
                                                image: NetworkImage(profileC
                                                    .user
                                                    .value!
                                                    .fotoKartuIdentitas!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -1.0,
                                            right: -1.0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.deletee();
                                              },
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.red,
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : AddPhotoButton(
                                    ontap: () {
                                      showModalBottomSheet(
                                        constraints: const BoxConstraints(
                                            maxHeight: 170),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 16, 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 10),
                                                Container(
                                                  height: 5,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: neutral30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .pickFromCamera(
                                                                context);
                                                      },
                                                      child: SizedBox(
                                                        height: 86,
                                                        width: 163,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/icons/camera.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(
                                                              'Foto dari kamera',
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral80,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .pickFromGallery(
                                                                context);
                                                      },
                                                      child: SizedBox(
                                                        height: 86,
                                                        width: 163,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/icons/gallery.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(
                                                              'Pilih dari galeri',
                                                              style:
                                                                  captionTextSemiBold
                                                                      .copyWith(
                                                                color:
                                                                    neutral80,
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
                                  ),
                          )),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => profileC.isLoading2.value
                  ? const LoadingButton()
                  : Button(
                      textbutton: 'Simpan',
                      onTap: () async {
                        if (controller.identityImage == null) {
                          profileC.isLoading2.value == true;
                          bool success = await profileC.changeIdentity(
                              jenisKartuIdentitas:
                                  controller.selectedType.toLowerCase(),
                              nomorKartuIdentitas:
                                  controller.identityNumberController.text,
                              linkfoto: profileC.user.value!.fotoKartuIdentitas,
                              foto: null);

                          if (success) {
                            profileC.isLoading2.value = false;
                            profileC.update();
                            Get.back();
                            EasyLoading.showSuccess('Data Berhasil Diubah');
                          } else {
                            profileC.isLoading2.value = false;
                          }
                        } else {
                          bool success = await profileC.changeIdentity(
                              jenisKartuIdentitas:
                                  controller.selectedType.toLowerCase(),
                              nomorKartuIdentitas:
                                  controller.identityNumberController.text,
                              foto: controller.identityImage!.path);

                          if (success) {
                            profileC.isLoading2.value = false;
                            profileC.update();
                            Get.back();
                            EasyLoading.showSuccess('Data Berhasil Diubah');
                          } else {
                            profileC.isLoading2.value = false;
                          }
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
