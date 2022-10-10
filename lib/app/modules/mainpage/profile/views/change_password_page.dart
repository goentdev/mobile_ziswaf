import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/controllers/user_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ChangePasswordPage extends GetView<UserController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
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
          'Ubah Kata Sandi',
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
                'Kata Sandi Lama',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: profileC.oldPasswordController,
              keyboardType: TextInputType.text,
              validator: (v) {
                if (v?.isEmpty ?? true) return 'Password wajib diisi';
                if (v!.length < 8) return 'Minimum 8 Karakter';
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
                hintText: 'Masukan kata sandi lama',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kata Sandi Baru',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: profileC.newPasswordController,
              keyboardType: TextInputType.text,
              validator: (v) {
                if (v?.isEmpty ?? true) return 'Password wajib diisi';
                if (v!.length < 8) return 'Minimum 8 Karakter';
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
                hintText: 'Masukan kata sandi baru',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Minimum 8 karakter',
                style: overlineSemiBold.copyWith(color: neutral70),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kata Sandi Lama',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: profileC.numberController,
              keyboardType: TextInputType.text,
              validator: (v) {
                if (v?.isEmpty ?? true) return 'Password wajib diisi';
                if (v!.length < 8) return 'Minimum 8 Karakter';
                if (v != profileC.confirmPasswordController.text) {
                  return 'Kata sandi harus sama dengan yang diatas';
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
                hintText: 'Masukan kata sandi lama',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: neutral20,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Setelah kata sandi diubah, silahkan masuk kembali dengan \nkata sandi baru.',
                style: captionTextRegular.copyWith(
                  color: neutral80,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Button(
              textbutton: 'Simpan',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
