import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ziswaf/app/modules/auth/controllers/otp_controller.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpFieldd extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final GlobalKey _formKey = GlobalKey();

  OtpFieldd(
      {super.key, this.onCompleted, required this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    final otpC = Get.put(OtpController());
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.fromWidth(400)),
          child: PinCodeTextField(
            appContext: context,
            autoFocus: true,
            pastedTextStyle: TextStyle(
              color: neutral60,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            validator: validator,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              fieldHeight: 50,
              fieldWidth: 40,
              activeColor: primaryMain,
              selectedColor: primaryMain,
              disabledColor: neutral30,
              inactiveColor: neutral30,
            ),
            cursorColor: Theme.of(context).colorScheme.primary,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: false,
            autoDismissKeyboard: false,
            controller: otpC.otpController,
            keyboardType: TextInputType.number,
            onCompleted: onCompleted,
            onChanged: onChanged,
            beforeTextPaste: (text) {
              debugPrint('Allowing to paste $text');
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        ),
      ),
    );
  }
}
