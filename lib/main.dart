import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: "Ziswaf",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  await Jiffy.locale("id");
}
