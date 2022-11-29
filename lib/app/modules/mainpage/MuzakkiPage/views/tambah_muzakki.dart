import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/muzaki_provider.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/MuzakkiPage/controllers/tambah_ubah_muzakki_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../controllers/muzakki_page_controller.dart';

class TambahMuzakki extends StatelessWidget {
  const TambahMuzakki({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerC = Get.put(TambahUbahMuzakkiController());
    final controller = Get.put(MuzakkiPageController());
    final formKey = GlobalKey<FormState>();
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
            size: 16,
          ),
        ),
        title: Text(
          'Tambah Muzakki',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
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
                  controller: controllerC.namemuzakkiController,
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return 'Nama Tidak boleh Kosong';
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
                  controller: controllerC.whatsappmuzakkiController,
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
                    'Email',
                    style: captionTextSemiBold.copyWith(color: neutral90),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  controller: controllerC.emailmuzakkiController,
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return 'Email Tidak boleh Kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: neutral30, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Masukkan Email',
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
                  physics: const NeverScrollableScrollPhysics(),
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
                              style: captionTextSemiBold.copyWith(
                                  color: neutral80),
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
                  physics: const NeverScrollableScrollPhysics(),
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
                              style: captionTextSemiBold.copyWith(
                                  color: neutral80),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
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
              if (formKey.currentState!.validate()) {
                String success = await MuzakiProvider().tambahMuzakki(
                    nama: controllerC.namemuzakkiController.text,
                    whatsapp: controllerC.whatsappmuzakkiController.text,
                    email: controllerC.emailmuzakkiController.text,
                    kategori: controllerC.selected.value,
                    tipe: controllerC.selectedType.value);
                await controller.refreshMuzaki();
                if (success == 'Berhasil') {
                  // ignore: use_build_context_synchronously
                  Get.back();
                  controllerC.namemuzakkiController.text = '';
                  controllerC.whatsappmuzakkiController.text = '';
                  controllerC.emailmuzakkiController.text = '';
                  controllerC.selected.value = '';
                  controllerC.selectedType.value = '';
                  controllerC.update();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Muzaki berhasil ditambah',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  controllerC.isLoading.value = false;
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'gagal menambahkan',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  controllerC.isLoading.value = false;
                }
              }
            },
            child: controllerC.isLoading.value
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
                    'Simpan',
                    style: textMBold.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
