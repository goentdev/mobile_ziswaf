import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class ChangePhotoButton extends StatefulWidget {
  const ChangePhotoButton({
    super.key,
    required this.ontap,
  });

  final VoidCallback ontap;

  @override
  State<ChangePhotoButton> createState() => _ChangePhotoButtonState();
}

class _ChangePhotoButtonState extends State<ChangePhotoButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_rounded, color: primaryMain),
            const SizedBox(width: 4),
            Text(
              'Ganti Foto',
              style: buttonTabsTextBold.copyWith(
                color: primaryMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
