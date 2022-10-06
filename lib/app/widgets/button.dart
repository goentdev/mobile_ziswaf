import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class Button extends StatelessWidget {
  final String textbutton;
  final VoidCallback onTap;
  const Button({super.key, required this.textbutton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryMain),
      ),
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        height: 36,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            textbutton,
            style: buttonTabsTextBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
