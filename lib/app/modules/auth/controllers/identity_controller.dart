import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IdentityController extends GetxController {
  final ImagePicker picker = ImagePicker();
  XFile? identityImage;
  late TextEditingController identityNumberController;
  List<String> identityType = ['KTP', 'SIM', 'PASPOR'].obs;
  RxString selectedType = ''.obs;

  @override
  void onInit() {
    identityNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    identityNumberController.dispose();
    super.onClose();
  }

  pickFromCamera() async {
    identityImage = await picker.pickImage(source: ImageSource.camera);
    update();
    Get.back();
  }

  pickFromGallery() async {
    identityImage = await picker.pickImage(source: ImageSource.gallery);
    update();
    Get.back();
  }
}
