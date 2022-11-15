import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/form_controller.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/identity_view.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

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
    formC.getProfile();
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
        child: Form(
          key: controller.formglobalkey,
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
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
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
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Email anda tidak boleh kosong';
                  }
                  return null;
                },
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
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kategori Relawan',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.kategoriTipe.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Obx(
                          () => Text(
                            controller.kategoriTipe[index],
                            style:
                                captionTextSemiBold.copyWith(color: neutral80),
                          ),
                        ),
                        trailing: Obx(
                          () => Radio<String>(
                            activeColor: primaryMain,
                            value: controller.kategoriTipe[index],
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
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => controller.isLoading.value
          ? const LoadingButton()
          : Column(
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
                        if (controller.formglobalkey.currentState!.validate() &&
                            controller.selectedType.value != '') {
                          bool sukses = await formC.changeName(
                              nama: controller.nameController.text);
                          await formC.changeEmail(
                              email: controller.emailController.text);
                          await formC.changeKategori(
                              kategori: controller.selectedType.value);
                          formC.getProfile();
                          if (sukses) {
                            controller.isLoading.value = false;
                            formC.update();
                            Get.to(() => IdentityView());
                          } else if (controller.selectedType.value != '') {
                            // ignore: use_build_context_synchronously
                            Get.snackbar('ERROR', 'Harap Lengkapi Form Diatas',
                                backgroundColor: Colors.red,
                                snackPosition: SnackPosition.TOP);
                            controller.isLoading.value = false;
                          } else {
                            controller.isLoading.value = false;
                          }
                        }
                      },
                      label: Text(
                        'Selanjutnya',
                        style: buttonTabsTextBold.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ])),
    );
  }
}
