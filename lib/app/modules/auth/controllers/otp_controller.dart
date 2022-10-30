import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController
  late TextEditingController otpController;
  Timer? timer;
  int remainingSeconds = 60;
  final time = '00.10'.obs;
  RxBool resend = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    startTimer(9);
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    otpController = TextEditingController();
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == -1) {
        timer.cancel();
        resend.value = true;
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }
  // Future<bool> konfirmasiOtp (){

  // }

  void increment() => count.value++;
}
