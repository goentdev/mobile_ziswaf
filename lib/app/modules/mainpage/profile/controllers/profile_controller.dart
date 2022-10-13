import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';

class ProfileController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController emailController;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  UserProvider userProvider = UserProvider();

  Rx<User?> user = User().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    emailController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    getProfile();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void logout() {
    sharedPrefs.logout();
  }

  void getProfile() async {
    isLoading.value = true;
    user.value = await userProvider.profile();
    isLoading.value = false;
  }
}
