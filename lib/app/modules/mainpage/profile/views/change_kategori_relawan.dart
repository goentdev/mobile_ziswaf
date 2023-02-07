import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class ChangeKategoriRelawan extends StatelessWidget {
  const ChangeKategoriRelawan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityController());
    final profileC = Get.put(ProfileController());
    controller.selectedKategori.value = profileC.user.value!.kategori!;
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
          'Ubah Kategori Relawan',
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
                'Pilih Kategori',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.kategoriRelawan.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Obx(
                        () => Text(
                          controller.kategoriRelawan[index],
                          style: captionTextSemiBold.copyWith(color: neutral80),
                        ),
                      ),
                      trailing: Obx(
                        () => Radio<String>(
                          activeColor: primaryMain,
                          value: controller.kategoriRelawan[index],
                          groupValue: controller.selectedKategori.value,
                          onChanged: (value) {
                            controller.selectedKategori.value = value!;
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
            Obx(
              () => profileC.isLoading2.value
                  ? const LoadingButton()
                  : Button(
                      textbutton: 'Simpan',
                      onTap: () async {
                        profileC.isLoading2.value == true;
                        bool success = await profileC.changeKategori(
                            kategori: controller.selectedKategori.value);

                        if (success) {
                          profileC.isLoading2.value = false;
                          profileC.update();
                          Get.back();
                          EasyLoading.showSuccess('Data Berhasil Diubah');
                        } else {
                          profileC.isLoading2.value = false;
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
