import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/pages/identitas_page.dart';
import 'package:mobile_ziswaf/pages/otp_sms_page.dart';
import 'package:mobile_ziswaf/theme.dart';
import 'package:mobile_ziswaf/widget/button.dart';

class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Lengkapi Data Diri',
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
                'Nama',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: neutral30, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Masukkan Nama',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: neutral30,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: 'Masukkan Email',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 41,
              width: 343,
              child: FloatingActionButton.extended(
                backgroundColor: primaryMain,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IdentitasPage(),
                      ));
                },
                label: Text(
                  'Selanjutnya',
                  style: buttonTabsTextBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          ]),
    );
  }
}
