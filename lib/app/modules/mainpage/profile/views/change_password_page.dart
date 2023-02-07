import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/controllers/user_controller.dart';
import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/change_password_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ChangePasswordPage extends GetView<UserController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ChangePasswordController());
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
        child: Obx(
          () => Form(
            key: profileC.registerFormKey,
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        profileC.changeShowPassword3();
                      },
                      child: Icon(profileC.showPassword3.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                  obscureText: profileC.showPassword3.value,
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        profileC.changeShowPassword2();
                      },
                      child: Icon(profileC.showPassword2.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                  obscureText: profileC.showPassword2.value,
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
                    'Konfirmasi Kata Sandi Baru',
                    style: captionTextSemiBold.copyWith(color: neutral90),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: profileC.confirmPasswordController,
                  keyboardType: TextInputType.text,
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Password wajib diisi';
                    if (v!.length < 8) return 'Minimum 8 Karakter';
                    if (v != profileC.newPasswordController.text) {
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
                    hintText: 'Konfirmasi Kata Sandi',
                    hintStyle: textMBold.copyWith(color: neutral60),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        profileC.changeShowPassword();
                      },
                      child: Icon(profileC.showPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                  obscureText: profileC.showPassword.value,
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => profileC.isLoading.value
            ? const LoadingButton()
            : SizedBox(
                height: 41,
                width: 355,
                child: FloatingActionButton.extended(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  onPressed: () async {
                    if (profileC.registerFormKey.currentState!.validate()) {
                      bool sukses = await UserProvider().changepassword(
                          passwordlama: profileC.oldPasswordController.text,
                          passwordbaru:
                              profileC.confirmPasswordController.text);
                      if (sukses) {
                        profileC.isLoading.value = false;
                        Get.offNamed(Routes.MAINPAGE);
                        profileC.update();
                      } else {
                        print('gagal');
                        profileC.isLoading.value = false;
                      }
                    }
                  },
                  label: Text(
                    'Simpan',
                    style: textMBold.copyWith(color: Colors.white),
                  ),
                  backgroundColor: primaryMain,
                ),
              ),
      ),
    );
  }
}
