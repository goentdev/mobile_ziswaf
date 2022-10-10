import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_ziswaf/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(controller.users[index]!.avatar!),
                ),
                title: Text(
                    'Name: ${controller.users[index]!.firstName!} ${controller.users[index]!.lastName!}'),
                subtitle: Text('Email: ${controller.users[index]!.email!}'),
                onTap: () => Get.toNamed(
                  Routes.USER_DETAIL,
                  arguments: controller.users[index],
                ),
                trailing: GestureDetector(
                  onTap: () =>
                      controller.deleteUser(controller.users[index]!.id!),
                  child: const Icon(
                    Icons.delete_forever,
                  ),
                ),
                onLongPress: () =>
                    controller.updateUser(controller.users[index]!.id!),
              );
            },
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: const Center(
            child: Text('Data not found'),
          ),
          onError: (error) => Center(
            child: Text(error.toString()),
          ),
        ));
  }
}
