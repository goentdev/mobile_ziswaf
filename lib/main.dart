import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';
import 'package:mobile_ziswaf/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(
    GetMaterialApp(
      title: "Ziswaf",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
  await Firebase.initializeApp(
    name: 'Ziswaf',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(sharedPrefs.token);
  await Jiffy.locale("id");
}
