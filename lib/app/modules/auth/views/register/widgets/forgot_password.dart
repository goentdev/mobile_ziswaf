import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/forgot_password_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';
import 'package:mobile_ziswaf/main.dart';
import 'package:get/get.dart';
import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotC = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.LOGIN),
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 10,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Lupa Kata Sandi',
          style: listTitleBold.copyWith(color: neutral90),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: forgotC.forgotFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukkan Email',
                style: pageTitleBold.copyWith(
                  color: neutral100,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Kami akan mengirimkan link pengaturan ulang kata sandi melalui email yang dikirimkan.',
                style: secondaryTextSemiBold.copyWith(color: neutral70),
              ),
              Text(
                '',
                style: secondaryTextSemiBold.copyWith(color: neutral70),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: forgotC.emailforgot,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Email anda tidak boleh kosong';
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
                  hintText: 'Masukan Email yang terdaftar',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  isDense: true,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: neutral30, width: 1),
          ),
        ),
        child: Obx(
          () => forgotC.isLoading.value
              ? const LoadingButton()
              : TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryMain,
                  ),
                  onPressed: () async {
                    if (forgotC.forgotFormKey.currentState!.validate()) {
                      bool sukses = await forgotC.forgotpass(
                          email: forgotC.emailforgot.text);
                      if (sukses) {
                        forgotC.isLoading.value = false;
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Silahkan Cek Email Anda Untuk Mengisi Ulang Kata Sandi Baru',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        Get.offNamed(Routes.LOGIN);
                      } else {
                        print('object');
                        forgotC.isLoading.value = false;
                      }
                    }
                  },
                  child: Text(
                    'Kirim',
                    style: textMBold.copyWith(color: Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
