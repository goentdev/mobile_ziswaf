import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';
import 'package:get/get.dart';

class ChangeTingkatRelawan extends StatelessWidget {
  const ChangeTingkatRelawan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityController());
    final profileC = Get.put(ProfileController());
    controller.selectedTingkat.value = profileC.user.value!.tingkatRelawan!;
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
          'Ubah Tingkat Relawan',
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
                'Pilih Tingkat',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.tingkatRelawan.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Obx(
                        () => Text(
                          controller.tingkatRelawan[index],
                          style: captionTextSemiBold.copyWith(color: neutral80),
                        ),
                      ),
                      trailing: Obx(
                        () => Radio<String>(
                          activeColor: primaryMain,
                          value: controller.tingkatRelawan[index],
                          groupValue: controller.selectedTingkat.value,
                          onChanged: (value) {
                            controller.selectedTingkat.value = value!;
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
                        bool success = await profileC.changeTingkat(
                            tingkat: controller.selectedTingkat.value);

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
