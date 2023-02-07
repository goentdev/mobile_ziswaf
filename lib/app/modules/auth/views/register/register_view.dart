import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/register_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/otp_view.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registC = Get.put(RegisterController());
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
          Obx(
            () => controller.isLoading.value
                ? const LoadingButton()
                : SizedBox(
                    height: 41,
                    width: 355,
                    child: FloatingActionButton.extended(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      onPressed: () async {
                        if (controller.registerFormKey.currentState!
                            .validate()) {
                          bool sukses = await registC.register(
                            whatsapp: controller.whatsappC.text,
                            status: 1,
                            role: 'relawan',
                            password: controller.confirmC.text,
                            email: 'Belum Mengisi Data',
                            fotoKartuIdentitas:
                                'https://firebasestorage.googleapis.com/v0/b/ziswaf-111b8.appspot.com/o/identitas-foto%2Fnot_found_image.jpg?alt=media&token=81a3bf91-0274-4099-8837-2784673c523e',
                            jenisKartuIdentitas: 'Belum Mengisi Data',
                            kategori: 'lembaga',
                            nama: 'Belum Mengisi Data',
                            nomorKartuIdentitas: 'Belum Mengisi Data',
                          );
                          if (sukses) {
                            controller.isLoading.value = false;
                            Get.off(() => OtpSmsPage(
                                  nomer: controller.whatsappC.text,
                                ));
                          } else {
                            controller.isLoading.value = false;
                          }
                        }
                      },
                      label: Text(
                        'Daftar',
                        style: textMBold.copyWith(color: Colors.white),
                      ),
                      backgroundColor: primaryMain,
                    ),
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
                  Get.offNamed(Routes.LOGIN);
                },
                child: Text(
                  'Masuk Sekarang',
                  style: captionTextBold.copyWith(color: primaryMain),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Obx(
          () => Form(
            key: controller.registerFormKey,
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
                  controller: controller.whatsappC,
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
                  controller: controller.passwordC,
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
                      onTap: () => controller.changeShowPassword(),
                      child: Icon(
                        controller.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: neutral60,
                        size: 18,
                      ),
                    ),
                  ),
                  obscureText: controller.showPassword.value,
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
                  controller: controller.confirmC,
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Password wajib diisi';
                    if (v!.length < 8) return 'Minimum 8 Karakter';
                    if (v != controller.passwordC.text) {
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
                      onTap: () => controller.changeShowPassword(),
                      child: Icon(
                        controller.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: neutral60,
                        size: 18,
                      ),
                    ),
                  ),
                  obscureText: controller.showPassword.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
