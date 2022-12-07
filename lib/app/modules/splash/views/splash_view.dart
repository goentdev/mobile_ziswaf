import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/login/login_page.dart';
import 'package:mobile_ziswaf/app/modules/mainpage/views/mainpage_view.dart';
import 'package:mobile_ziswaf/app/modules/onboarding/views/on_boarding_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xffECF7F4)],
        ),
      ),
      child: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        splash: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(97.95, 0, 97.95, 0),
            child: Image.asset(
              'assets/images/Logo Ziswaf.png',
              width: 179.09,
            ),
          ),
        ),
        nextScreen: sharedPrefs.skipIntro == true
            ? sharedPrefs.token == null
                ? const LoginPage()
                : const MainpageView()
            : const OnboardingScreen(),
        splashIconSize: double.infinity,
      ),
    );
  }
}
