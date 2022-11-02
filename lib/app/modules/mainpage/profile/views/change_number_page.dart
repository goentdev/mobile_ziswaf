import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/controllers/user_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ChangeNumberPage extends GetView<UserController> {
  const ChangeNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    profileC.numberController.text = profileC.user.value!.whatsapp!;
    return Scaffold(
      backgroundColor: neutral10,
      appBar: AppBar(
        backgroundColor: neutral10,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.left_chevron,
            size: 14,
            color: neutral90,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Ubah Nomor Whatsapp',
          style: listItemTitleBold.copyWith(color: neutral90),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor WhatsApp',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: profileC.numberController,
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v?.isEmpty ?? true) {
                  return 'No Whatsapp tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: neutral40,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: 'Masukan nomor whatsapp',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => profileC.isLoading.value
                  ? const LoadingButton()
                  : Button(
                      textbutton: 'Simpan',
                      onTap: () async {
                        bool success = await profileC.changeNumber(
                            whatsapp: profileC.numberController.text);
                        profileC.getProfile();
                        if (success) {
                          profileC.isLoading.value = false;
                          profileC.update();
                          Get.back();
                          EasyLoading.showSuccess('Data Berhasil Diubah');
                        } else {
                          profileC.isLoading.value = false;
                        }
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
