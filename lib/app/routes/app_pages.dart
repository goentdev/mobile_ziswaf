import 'package:get/get.dart';

import '../modules/OnBoarding/views/on_boarding_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login/login_page.dart';
import '../modules/auth/views/register/choose_bank_view.dart';
import '../modules/auth/views/register/form_view.dart';
import '../modules/auth/views/register/identity_view.dart';
import '../modules/auth/views/register/otp_view.dart';
import '../modules/auth/views/register/register_view.dart';
import '../modules/mainpage/MuzakkiPage/bindings/muzakki_page_binding.dart';
import '../modules/mainpage/MuzakkiPage/views/muzakki_page_view.dart';
import '../modules/mainpage/ProfilePage/bindings/profile_page_binding.dart';
import '../modules/mainpage/ProfilePage/views/profile_page_view.dart';
import '../modules/mainpage/ProgramPage/bindings/program_page_binding.dart';
import '../modules/mainpage/ProgramPage/views/program_page_view.dart';
import '../modules/mainpage/bindings/mainpage_binding.dart';
import '../modules/mainpage/views/mainpage_view.dart';
import '../modules/onboarding/bindings/on_boarding_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnboardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpSmsPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.IDENTITY,
      page: () => const IdentityView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.BANK,
      page: () => const ChooseBankView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.MAINPAGE,
      page: () => const MainpageView(),
      binding: MainpageBinding(),
      children: [
        GetPage(
          name: _Paths.PROGRAM_PAGE,
          page: () => const ProgramPageView(),
          binding: ProgramPageBinding(),
        ),
        GetPage(
          name: _Paths.MUZAKKI_PAGE,
          page: () => const MuzakkiPageView(),
          binding: MuzakkiPageBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_PAGE,
          page: () => const ProfilePageView(),
          binding: ProfilePageBinding(),
        ),
      ],
    ),
  ];
}