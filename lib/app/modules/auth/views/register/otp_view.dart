import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/otp_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/form_view.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/otp_field.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class OtpSmsPage extends GetView<OtpController> {
  final String? nomer;
  final String? password;
  final ValueChanged<String>? onCompleted;
  // final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final bool? showHelperText;

  const OtpSmsPage(
      {super.key,
      this.password,
      this.nomer,
      this.onCompleted,
      this.validator,
      this.showHelperText});

  @override
  Widget build(BuildContext context) {
    final otpC = Get.put(OtpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 10,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Kode Verifikasi OTP',
          style: listTitleBold.copyWith(color: neutral90),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukan OTP',
              style: pageTitleBold.copyWith(
                color: neutral100,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Kami mengirimkan kode OTP melalui nomor',
              style: secondaryTextSemiBold.copyWith(color: neutral70),
            ),
            Text(
              nomer!,
              style: secondaryTextSemiBold.copyWith(color: neutral70),
            ),
            const SizedBox(
              height: 48,
            ),
            OtpFieldd(
              onCompleted: (String value) async {
                bool sukses = await AuthProvider().konfirmasiOtp(
                  otp: otpC.otpController.text,
                );
                if (sukses) {
                  Get.to(() => FormView());
                  otpC.update();
                } else {
                  print('kode salah');
                }
              },
              onChanged: (String value) {},
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Align(
                alignment: Alignment.center,
                child: otpC.resend.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tidak Mendapatkan Kode? ',
                              style:
                                  captionTextBold.copyWith(color: neutral100)),
                          InkWell(
                            onTap: () async {
                              otpC.startTimer(10);
                              otpC.resend.value = false;
                              bool success = await otpC.resendotpp(
                                  otp: otpC.otpController.text);
                              if (success) {
                                print('berhasil');
                              } else {
                                print('gagal');
                              }
                            },
                            child: Text(
                              'Kirim Ulang Code',
                              style:
                                  captionTextBold.copyWith(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    : Text(
                        otpC.time.value,
                        style: secondaryTextBold.copyWith(
                          color: neutral90,
                        ),
                      )))
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //   child: Button(
      //     onTap: () => Get.to(() => FormView(
      //           nomer: nomer,
      //           password: password,
      //         )),
      //     textbutton: 'Selanjutnya',
      //   ),
      // ),
    );
  }
}
