import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/app/theme/fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../theme/colors.dart';

class CardDana extends StatelessWidget {
  const CardDana({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 20.5),
            decoration: BoxDecoration(
              color: neutral10,
              border: Border(
                bottom: BorderSide(color: neutral40),
                left: BorderSide(color: neutral40),
                top: BorderSide(color: neutral40),
                right: BorderSide(color: neutral40),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      'assets/icons/calendar.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sedekah Bangunan Infrastruktur',
                          style: listTitleSemiBold.copyWith(color: neutral100),
                        ),
                        Text(
                          '${10} Muzakki',
                          style: captionTextSemiBold.copyWith(color: neutral70),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Terkumpul',
                      style: captionTextSemiBold.copyWith(color: neutral70),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp 500.000',
                        style: captionTextSemiBold.copyWith(color: neutral100),
                      ),
                      Text(
                        '1 bulan lagi',
                        style: captionTextBold.copyWith(color: secondaryMain),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: LinearPercentIndicator(
                    alignment: MainAxisAlignment.start,
                    barRadius: const Radius.circular(20),
                    lineHeight: 6,
                    animation: true,
                    percent: 67 / 100,
                    trailing: Text(
                      '69%',
                      style: titleExtraTextBold.copyWith(color: neutral100),
                    ),
                    progressColor: primaryMain,
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
