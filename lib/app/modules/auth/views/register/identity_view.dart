import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/identity_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/add_foto_widget.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

class IdentityView extends GetView<IdentityController> {
  const IdentityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Masukan Kartu Identitas Diri',
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
                'Jenis Kartu Identitas  ',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.identityType.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Obx(
                        () => Text(
                          controller.identityType[index],
                          style: captionTextSemiBold.copyWith(color: neutral80),
                        ),
                      ),
                      trailing: Obx(
                        () => Radio<String>(
                          activeColor: primaryMain,
                          value: controller.identityType[index],
                          groupValue: controller.selectedType.value,
                          onChanged: (value) {
                            controller.selectedType.value = value!;
                          },
                        ),
                      ),
                    ),
                    Divider(
                      color: neutral30,
                      thickness: 1,
                      height: 8,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controller.identityNumberController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: neutral30, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Masukkan nomor kartu identitas',
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
                'Foto Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AddPhotoButton(
              ontap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
              textbutton: 'Selanjutnya',
              onTap: () => Get.toNamed(Routes.BANK),
            ),
          ],
        ),
      ),
    );
  }
}
