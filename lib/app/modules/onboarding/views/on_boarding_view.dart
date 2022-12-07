import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_ziswaf/app/modules/auth/views/login/login_page.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? primaryMain : primaryBorder,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xffECF7F4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Ilustrasi1.png',
                                ),
                                height: 343.0,
                                width: 343.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Pendataan Muzakki\nyang mudah',
                              style: h2ExtraBold,
                            ),
                            const SizedBox(height: 24.0),
                            Text(
                              'Data setiap muzakki yang ingin membayar zakat\nhanya melalui handphone',
                              style: textLSemibold.copyWith(color: neutral80),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Ilustrasi2.png',
                                ),
                                height: 343.0,
                                width: 343.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Buat Program dari hasil\ndonasi',
                              style: h2ExtraBold,
                            ),
                            const SizedBox(height: 24.0),
                            Text(
                              'Rencanakan program untuk mengelola hasil\ndonasi',
                              style: textLSemibold.copyWith(color: neutral80),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Ilustrasi3.png',
                                ),
                                height: 343.0,
                                width: 343.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Monitor target\npencapaian program',
                              style: h2ExtraBold,
                            ),
                            const SizedBox(height: 24.0),
                            Text(
                              'Pastikan dana terkumpul sesuai dengan target\npencapaian program yang telah dibuat',
                              style: textLSemibold.copyWith(color: neutral80),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      height: 41,
                      width: 355,
                      child: FloatingActionButton.extended(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        label: Text(
                          'Selanjutnya',
                          style: textMBold.copyWith(color: Colors.white),
                        ),
                        backgroundColor: primaryMain,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
