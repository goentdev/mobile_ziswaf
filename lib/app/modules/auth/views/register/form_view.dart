import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/form_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/identity_view.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class FormView extends GetView<FormController> {
  final String? password;
  final String? nomer;

  const FormView({
    super.key,
    this.password,
    this.nomer,
  });

  @override
  Widget build(BuildContext context) {
    final formC = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 10,
          ),
        ),
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
              controller: controller.nameController,
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
              controller: controller.emailController,
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  bool sukses = await formC.changeName(
                      nama: controller.nameController.text);
                  await formC.changeEmail(
                      email: controller.emailController.text);
                  await formC.changeKategori(kategori: 'lembaga');
                  if (sukses) {
                    formC.update();
                    Get.to(IdentityView());
                  } else {
                    EasyLoading.showError('Terjadi Server Error');
                  }
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
