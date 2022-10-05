import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/auth_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/core/theme/colors.dart';
import 'package:mobile_ziswaf/core/theme/fonts.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/Logo Ziswaf.png',
            width: 95.74,
            height: 24,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 41,
            width: 355,
            child: FloatingActionButton.extended(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              onPressed: () {
                // if (authC.registerFormKey.currentState!.validate()) {
                Get.toNamed(Routes.HOME);
                // }
              },
              label: Text(
                'Daftar',
                style: textMBold.copyWith(color: Colors.white),
              ),
              backgroundColor: primaryMain,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah memiliki akun? ',
                style: captionTextBold.copyWith(color: neutral80),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.LOGIN);
                },
                child: Text(
                  'Masuk Sekarang',
                  style: captionTextBold.copyWith(color: primaryMain),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Obx(
          () => Form(
            key: authC.registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  style: pageTitleBold.copyWith(color: neutral100),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Isi form di bawah untuk mendaftarkan akun',
                  style: secondaryTextSemiBold.copyWith(color: neutral70),
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Nomor Whatsapp',
                      style: captionTextSemiBold.copyWith(color: neutral90)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: authC.whatsappC,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return 'Nomor Whatsapp Tidak boleh Kosong';
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
                    hintText: 'Masukan nomor Whatsapp',
                    hintStyle: textMBold.copyWith(color: neutral60),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kata Sandi',
                    style: captionTextSemiBold.copyWith(color: neutral90),
                  ),
                ),
                TextFormField(
                  controller: authC.passwordC,
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Password wajib diisi';
                    if (v!.length < 8) return 'Minimum 8 Karakter';
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: neutral40,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    isDense: true,
                    hintText: 'Masukan Kata Sandi',
                    hintStyle: textMBold.copyWith(color: neutral60),
                    suffixIcon: GestureDetector(
                      onTap: () => authC.changeShowPassword(),
                      child: Icon(
                        authC.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: neutral60,
                        size: 18,
                      ),
                    ),
                  ),
                  obscureText: authC.showPassword.value,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Minimum 8 karakter',
                  style: overlineSemiBold.copyWith(color: neutral70),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Konfirmasi Kata Sandi',
                    style: captionTextSemiBold.copyWith(color: neutral90),
                  ),
                ),
                TextFormField(
                  controller: authC.confirmC,
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Password wajib diisi';
                    if (v!.length < 8) return 'Minimum 8 Karakter';
                    if (v != authC.passwordC.text) {
                      return 'Kata sandi harus sama dengan yang diatas';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: neutral40,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    isDense: true,
                    hintText: 'Ketik ulang Kata sandi',
                    hintStyle: textMBold.copyWith(color: neutral60),
                    suffixIcon: GestureDetector(
                      onTap: () => authC.changeShowPassword(),
                      child: Icon(
                        authC.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: neutral60,
                        size: 18,
                      ),
                    ),
                  ),
                  obscureText: authC.showPassword.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
