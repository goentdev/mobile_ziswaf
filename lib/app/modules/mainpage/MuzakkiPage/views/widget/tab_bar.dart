import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/fonts.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? controller;
  final void Function(int)? onTap;
  final List<Widget> tabs;
  const MyTabBar({
    Key? key,
    this.controller,
    this.onTap,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.0),
        border: Border(bottom: BorderSide(color: neutral30, width: 2)),
      ),
      child: TabBar(
        labelColor: primaryMain,
        labelStyle: buttonTabsTextBold,
        indicatorColor: primaryMain,
        indicatorWeight: 2,
        unselectedLabelColor: neutral50, //For Selected tab
        unselectedLabelStyle: buttonTabsTextBold, //For Un-selected Tabs
        controller: controller,
        tabs: tabs,
        onTap: onTap,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
