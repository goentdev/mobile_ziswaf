import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/theme.dart';

class TambahFotoButton extends StatefulWidget {
  const TambahFotoButton({
    super.key,
    required this.ontap,
  });

  final VoidCallback ontap;

  @override
  State<TambahFotoButton> createState() => _TambahFotoButtonState();
}

class _TambahFotoButtonState extends State<TambahFotoButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: neutral40,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_rounded, color: primaryMain),
            const SizedBox(width: 4),
            Text(
              'Tambah Foto',
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
