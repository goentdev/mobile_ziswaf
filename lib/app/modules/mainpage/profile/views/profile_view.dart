import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

import '../controllers/profile_controller.dart';
import '../widgets/card_profile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final user = controller.user.value;
    controller.getProfile();

    return Scaffold(
      backgroundColor: neutral20,
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          initState: (_) {},
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  height: 82,
                  color: neutral10,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          image: const DecorationImage(
                            image: AssetImage('assets/icons/iconprofile.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user!.nama!,
                            style: titleTextBold.copyWith(color: neutral100),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 121,
                            height: 20,
                            decoration: BoxDecoration(
                              color: secondarysurface,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: secondaryMain,
                                      size: 16,
                                    ),
                                    Text(
                                      'Relawan Tingkat Atas',
                                      style: overlineBold.copyWith(
                                          color: secondaryMain),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  margin: const EdgeInsets.only(bottom: 16.11),
                  height: 307,
                  width: double.infinity,
                  color: neutral10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Akun',
                        style: titleTextBold.copyWith(color: neutral100),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CardProfile(
                        title: 'Nama',
                        gambar: 'assets/icons/kontakk.png',
                        subtittle: user.nama!,
                        onTap: () => Get.toNamed(Routes.CHANGENAME),
                      ),
                      Divider(
                        color: neutral30,
                        thickness: 1,
                      ),
                      CardProfile(
                        title: 'Nomor Whatsapp',
                        subtittle: user.whatsapp!,
                        gambar: 'assets/icons/phone.png',
                        onTap: () => Get.toNamed(Routes.CHANGENUMBER),
                      ),
                      Divider(
                        color: neutral30,
                        thickness: 1,
                      ),
                      CardProfile(
                        title: 'Email',
                        subtittle: user.email!,
                        gambar: "assets/icons/mail.png",
                        onTap: () => Get.toNamed(Routes.CHANGEEMAIL),
                      ),
                      Divider(
                        color: neutral30,
                        thickness: 1,
                      ),
                      CardProfile(
                        title: 'Kartu Identitas',
                        subtittle: user.jenisKartuIdentitas!.toUpperCase(),
                        gambar: "assets/icons/identity.png",
                        onTap: () => Get.toNamed(Routes.CHANGEIDENTITY),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  height: 112,
                  width: double.infinity,
                  color: neutral10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rekening Bank',
                        style: titleTextBold.copyWith(
                          color: neutral100,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.CHANGEBANK),
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 15,
                                    child: Image.asset(
                                      'assets/icons/credit.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.user.value!.bank!.nama!,
                                        style: captionTextSemiBold.copyWith(
                                          color: neutral90,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        user.nomorRekening.toString(),
                                        style: captionTextSemiBold.copyWith(
                                            color: neutral80),
                                      ),
                                      Text(
                                        'a.n ${user.namaRekening}',
                                        style: captionTextSemiBold.copyWith(
                                          color: neutral80,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: neutral70,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  height: 97,
                  width: double.infinity,
                  color: neutral10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keamanan',
                        style: titleTextBold.copyWith(
                          color: neutral100,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.CHANGEPASSWORD),
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 15,
                                    child: Image.asset(
                                      'assets/icons/kunci.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Ubah kata sandi',
                                    style: captionTextSemiBold.copyWith(
                                        color: neutral90),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: neutral70,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.logout();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: 62,
                    color: neutral10,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/exit.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Keluar',
                          style:
                              captionTextSemiBold.copyWith(color: dangerMain),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
