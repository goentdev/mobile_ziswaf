import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/controllers/profile_controller.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/profile/views/profile_view.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../MuzakkiPage/views/muzakki_page_view.dart';
import '../ProgramPage/views/program_page_view.dart';
import '../controllers/mainpage_controller.dart';

class MainpageView extends GetView<MainpageController> {
  const MainpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserProvider());
    Get.put(ProfileController());
    Widget body() {
      switch (controller.currentIndex) {
        case 0:
          return const ProgramPageView();
        case 1:
          return const MuzakkiPageView();
        case 2:
          return const ProfileView();

        default:
          return const ProgramPageView();
      }
    }

    return GetBuilder<MainpageController>(
        init: MainpageController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: neutral50,
              selectedItemColor: primaryMain,
              selectedFontSize: 12,
              selectedLabelStyle: overlineSemiBold2,
              backgroundColor: Colors.white,
              currentIndex: controller.currentIndex,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              onTap: controller.changePage,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/program.png',
                    width: 18,
                    height: 24,
                    color:
                        controller.currentIndex == 0 ? primaryMain : neutral50,
                  ),
                  label: 'Program',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/muzakki.png',
                    width: 24,
                    height: 24,
                    color:
                        controller.currentIndex == 1 ? primaryMain : neutral50,
                  ),
                  label: 'Muzakki',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/iconprofile.png',
                    width: 18,
                    height: 24,
                    color:
                        controller.currentIndex == 2 ? primaryMain : neutral50,
                  ),
                  label: 'Profil',
                ),
              ],
            ),
            body: body(),
          );
        });
  }
}
