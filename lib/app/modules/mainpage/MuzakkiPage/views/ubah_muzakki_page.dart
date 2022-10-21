import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/controllers/tambah_ubah_muzakki_controller.dart';
import 'package:mobile_ziswaf/app/widgets/button.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';

class UbahMuzakki extends StatelessWidget {
  const UbahMuzakki({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerC = Get.put(TambahUbahMuzakkiController());
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
          'Ubah Muzakki',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                // controller: controller.nameController,
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
              const SizedBox(height: 16),
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
                // controller: controller.whatsappC,
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
                  'Nama',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                // controller: controller.nameController,
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
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kategori Muzakki',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controllerC.kategorimuzakki.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Obx(
                          () => Text(
                            controllerC.kategorimuzakki[index],
                            style:
                                captionTextSemiBold.copyWith(color: neutral80),
                          ),
                        ),
                        trailing: Obx(
                          () => Radio<String>(
                            activeColor: primaryMain,
                            value: controllerC.kategorimuzakki[index],
                            groupValue: controllerC.selected.value,
                            onChanged: (value) {
                              controllerC.selected.value = value!;
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
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tipe Muzakki',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controllerC.tipemuzakki.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Obx(
                          () => Text(
                            controllerC.tipemuzakki[index],
                            style:
                                captionTextSemiBold.copyWith(color: neutral80),
                          ),
                        ),
                        trailing: Obx(
                          () => Radio<String>(
                            activeColor: primaryMain,
                            value: controllerC.tipemuzakki[index],
                            groupValue: controllerC.selectedType.value,
                            onChanged: (value) {
                              controllerC.selectedType.value = value!;
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
              const SizedBox(height: 0),
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
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryMain,
          ),
          onPressed: () async {
            Get.back();
          },
          child: Text(
            'Simpan',
            style: textMBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
