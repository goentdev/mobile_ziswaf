import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/login_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/forgot_password.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/ProgramPage/controllers/program_page_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final controller2 = Get.put(ProgramPageController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/Logo Ziswaf.png',
            width: 94,
            height: 40,
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      onPressed: () async {
                        if (controller.loginFormKey.currentState!.validate()) {
                          bool success = await controller.login(
                            whatsapp: controller.whatsappC.text,
                            password: controller.passwordC.text,
                          );
                          if (success) {
                            controller2.gettotalberlangsungg2();
                            controller2.gettotalselesai2();
                            controller2.getPrograms2();
                            Get.offAllNamed(Routes.MAINPAGE);
                            controller.isLoading.value = false;
                          } else {
                            controller.isLoading.value = false;
                          }
                        }
                      },
                      label: controller.isLoading.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Loading',
                                  style: paragraphTextBold.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              'Masuk',
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
                'Belum memiliki akun? ',
                style: captionTextBold.copyWith(color: neutral80),
              ),
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.REGISTER);
                },
                child: Text(
                  'Daftar disini',
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
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masuk',
                style: pageTitleBold.copyWith(color: neutral100),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Masuk dengan akun yang terdaftar.',
                style: secondaryTextSemiBold.copyWith(color: neutral70),
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nomor Whatsapp',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
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
                  hintText: 'Masukan nomor WhatsApp',
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
              Obx(
                () => TextFormField(
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
                      onTap: () {
                        controller.changeShowPassword();
                      },
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
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Get.offAll(() => const ForgotPassword());
                },
                child: Text(
                  'Lupa kata sandi?',
                  style: captionTextSemiBold.copyWith(color: secondaryMain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
