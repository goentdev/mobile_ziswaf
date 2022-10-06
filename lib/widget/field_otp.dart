import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ziswaf/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FieldOtp extends StatefulWidget {
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  const FieldOtp({
    Key? key,
    this.onCompleted,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<FieldOtp> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<FieldOtp> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _formKey = GlobalKey();

  @override
  void didUpdateWidget(covariant FieldOtp oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != widget) {
      _controller.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _controller.dispose();
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
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
            validator: widget.validator,
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
            controller: _controller,
            keyboardType: TextInputType.number,
            onCompleted: widget.onCompleted,
            onChanged: widget.onChanged,
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
