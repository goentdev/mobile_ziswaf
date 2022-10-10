import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/colors.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';

class CardProfile extends StatelessWidget {
  final String title;
  final String gambar;
  final String subtittle;
  final VoidCallback onTap;

  const CardProfile({
    super.key,
    required this.title,
    required this.subtittle,
    required this.gambar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: Image.asset(
                  gambar,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: captionTextBold.copyWith(color: neutral90),
                  ),
                  Text(
                    subtittle,
                    style: captionTextSemiBold.copyWith(color: neutral70),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
