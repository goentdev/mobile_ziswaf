import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/controllers/user_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ChangeNamePage extends GetView<UserController> {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
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
          'Ubah Nama',
          style: listItemTitleBold.copyWith(color: neutral90),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nama',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: profileC.nameController,
              keyboardType: TextInputType.text,
              validator: (v) {
                if (v?.isEmpty ?? true) {
                  return 'Nama tidak boleh kosong';
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
                hintText: 'Masukan nama',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(height: 24),
            Button(
              textbutton: 'Simpan',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
