import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/register/widgets/card_rekening_profile.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/widgets/card_rekening.dart';
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
    controller.getbankyayasan();
    controller.getProfile2();
    return Obx(
      () => Scaffold(
        backgroundColor: neutral20,
        body: controller.user.value!.status == 1
            ? SingleChildScrollView(
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
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  backgroundColor: primarySurface,
                                  child: controller.user.value!.nama![0]
                                          .contains(" ")
                                      ? Text(
                                          controller.user.value!.nama![0][0]
                                                  .toUpperCase() +
                                              controller.user.value!.nama![0]
                                                  .split(" ")
                                                  .last[0]
                                                  .toUpperCase(),
                                          style: textSBold.copyWith(
                                              color: primaryMain),
                                        )
                                      : Text(
                                          controller.user.value!.nama![0][0]
                                              .toUpperCase(),
                                          style: titleextraBold2.copyWith(
                                              color: primaryMain),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.user.value!.nama!,
                                    style: titleTextBold.copyWith(
                                        color: neutral100),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  controller.user.value!.tingkatRelawan ==
                                              'Atas' ||
                                          controller
                                                  .user.value!.tingkatRelawan ==
                                              'Utama'
                                      ? Container(
                                          width: 121,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: secondarysurface,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    color: secondaryMain,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    'Relawan Tingkat ${controller.user.value!.tingkatRelawan}',
                                                    style:
                                                        overlineBold.copyWith(
                                                            color:
                                                                secondaryMain),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      : controller.user.value!.tingkatRelawan ==
                                                  'Menengah' ||
                                              controller.user.value!
                                                      .tingkatRelawan ==
                                                  'Dewasa'
                                          ? Container(
                                              width: 145,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: neutral20,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate_rounded,
                                                        color: neutral60,
                                                        size: 16,
                                                      ),
                                                      Text(
                                                        'Relawan Tingkat ${controller.user.value!.tingkatRelawan}',
                                                        style: overlineBold
                                                            .copyWith(
                                                                color:
                                                                    neutral60),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(
                                              width: 127,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFE6CF),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.star_rate_rounded,
                                                        color:
                                                            Color(0xffDF823C),
                                                        size: 16,
                                                      ),
                                                      Text(
                                                        'Relawan Tingkat ${controller.user.value?.tingkatRelawan}',
                                                        style: overlineBold
                                                            .copyWith(
                                                                color: const Color(
                                                                    0xffDF823C)),
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
                          height: 460,
                          width: double.infinity,
                          color: neutral10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data Akun',
                                style:
                                    titleTextBold.copyWith(color: neutral100),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CardProfile(
                                title: 'Nama',
                                gambar: 'assets/icons/kontakk.png',
                                subtittle: controller.user.value!.nama!,
                                onTap: () => Get.toNamed(Routes.CHANGENAME),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                              CardProfile(
                                title: 'Nomor Whatsapp',
                                subtittle: controller.user.value!.whatsapp!,
                                gambar: 'assets/icons/phone.png',
                                onTap: () => Get.toNamed(Routes.CHANGENUMBER),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                              CardProfile(
                                title: 'Email',
                                subtittle: controller.user.value!.email!,
                                gambar: "assets/icons/mail.png",
                                onTap: () => Get.toNamed(Routes.CHANGEEMAIL),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                              CardProfile(
                                title: 'Kategori Relawan',
                                subtittle: controller.user.value!.kategori!,
                                gambar: "assets/icons/relawan.png",
                                onTap: () =>
                                    Get.toNamed(Routes.CHANGEKATEOGRIRELAWAN),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                              CardProfile(
                                title: 'Tingkat Relawan',
                                subtittle:
                                    controller.user.value!.tingkatRelawan!,
                                gambar: "assets/icons/tingkat_relawan.png",
                                onTap: () =>
                                    Get.toNamed(Routes.CHANGETINGKATRELAWAN),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                              CardProfile(
                                title: 'Kartu Identitas',
                                subtittle: controller
                                    .user.value!.jenisKartuIdentitas!
                                    .toUpperCase(),
                                gambar: "assets/icons/identity.png",
                                onTap: () => Get.toNamed(Routes.CHANGEIDENTITY),
                              ),
                              Divider(
                                color: neutral30,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 49,
                          width: double.infinity,
                          color: neutral10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rekening Yayasan',
                                style: titleTextBold.copyWith(
                                  color: neutral100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: controller.bankyayasan.length,
                          itemBuilder: (context, index) {
                            var bank = controller.bankyayasan;
                            return CardRekeningProfile(
                                namaBank: bank[index]!.bank!.nama!,
                                nomorRekening: bank[index]!.nomorRekening!,
                                namaRekening: bank[index]!.namaRekening!);
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  style: captionTextSemiBold.copyWith(
                                      color: dangerMain),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 91,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/nonaktif.png',
                      width: 288,
                      height: 288,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Akun Anda\nDinonaktifkan',
                      style: h2ExtraBold.copyWith(color: neutral100),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Silahkan hubungi admin untuk mengaktifkan\nakun Anda kembali',
                      style: textLSemibold.copyWith(color: neutral80),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
