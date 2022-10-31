import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';

import '../../../data/models/user_model.dart';
import '../../../data/providers/user_provider.dart';

class OtpController extends GetxController {
  AuthProvider userProvider = AuthProvider();

  Rx<User?> user = User().obs;

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

  Future<bool> resendotpp({
    String? otp,
  }) async {
    bool success = await userProvider.resendotpp({
      'otp': otp,
    });
    if (success) {
      user.update((val) {
        val!.otp = otp;
      });
      return true;
    } else {
      return false;
    }
  }

  void increment() => count.value++;
}
