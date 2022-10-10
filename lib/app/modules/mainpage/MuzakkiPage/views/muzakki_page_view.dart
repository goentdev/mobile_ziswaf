import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/muzakki_page_controller.dart';

class MuzakkiPageView extends GetView<MuzakkiPageController> {
  const MuzakkiPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MuzakkiPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MuzakkiPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
