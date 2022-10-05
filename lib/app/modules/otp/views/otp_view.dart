import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/modules/otp/widgets/otp_field.dart';
import 'package:mobile_ziswaf/core/theme/colors.dart';
import 'package:mobile_ziswaf/core/theme/fonts.dart';

class OtpSmsPage extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final ValueChanged<String>? onCompleted;
  // final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final bool? showHelperText;

  const OtpSmsPage(
      {super.key,
      this.title,
      this.subtitle,
      this.onCompleted,
      this.validator,
      this.showHelperText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
              '08211234321',
              style: secondaryTextSemiBold.copyWith(color: neutral70),
            ),
            const SizedBox(
              height: 48,
            ),
            OtpField(
              onChanged: (value) {},
              onCompleted: onCompleted,
              validator: validator,
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '00:59',
                style: secondaryTextBold.copyWith(
                  color: neutral90,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
