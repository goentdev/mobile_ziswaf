import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/modules/home/controllers/home_controller.dart';

class UserDetail extends GetView<HomeController> {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.avatar!),
          ),
          Text(user.firstName!),
        ],
      ),
    );
  }
}
