import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/pages/homepage.dart';
import 'package:mobile_ziswaf/pages/otp_sms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtpSmsPage(),
    );
  }
}
