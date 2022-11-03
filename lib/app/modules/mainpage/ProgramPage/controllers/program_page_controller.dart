import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/program_model.dart';
import 'package:mobile_ziswaf/app/data/models/totaldanaprogram_model.dart';
import 'package:mobile_ziswaf/app/data/providers/program_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/totaldanaprogram_provider.dart';

import '../../../../data/models/user_model.dart';

class ProgramPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  final count = 0.obs;
  ProgramProvider programProvider = ProgramProvider();
  TotaldanaprogramProvider totalDanaProgramprovider =
      TotaldanaprogramProvider();
  Rx<Totaldanaprogram?> totalDana = Totaldanaprogram().obs;

  RxList<Program>? program = <Program>[].obs;
  Rx<Program?> program2 = Program().obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    gettotaldana();
    getPrograms();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  gettotaldana() async {
    totalDana.value = await totalDanaProgramprovider.totaldanaprogram();
    update();
  }

  getPrograms() async {
    isLoading.value = true;
    program!.assignAll(await programProvider.getProgram());
    update();
    isLoading.value = false;
  }

  refreshProgram() async {
    isLoading.value = true;

    program!.assignAll(await programProvider.getProgram());

    isLoading.value = false;
  }
}
