import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_page_controller.dart';

class ProgramPageView extends GetView<ProgramPageController> {
  const ProgramPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProgramPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
