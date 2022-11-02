import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
