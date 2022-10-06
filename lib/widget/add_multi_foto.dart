import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/theme.dart';

class MultiFoto extends StatelessWidget {
  const MultiFoto({
    Key? key,
    this.icon,
    this.onTap,
    required this.label,
  }) : super(key: key);

  final IconData? icon;

  final VoidCallback? onTap;

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Ink(
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: neutral40),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: neutral60),
            const SizedBox(height: 8.5),
            Text(
              label,
              style: captionTextSemiBold.copyWith(
                color: neutral60,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
