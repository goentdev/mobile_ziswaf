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

  Future<bool> changeName({required String nama}) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'nama': nama,
    });
    if (success) {
      user.update((val) {
        val!.nama = nama;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeNumber({required String whatsapp}) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'whatsapp': whatsapp,
    });
    if (success) {
      user.update((val) {
        val!.whatsapp = whatsapp;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeEmail({required String email}) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'email': email,
    });
    if (success) {
      user.update((val) {
        val!.email = email;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeIdentity({
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
  }) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'jenis_kartu_identitas': jenisKartuIdentitas,
      'nomor_kartu_identitas': nomorKartuIdentitas,
    });
    if (success) {
      user.update((val) {
        val!.jenisKartuIdentitas = jenisKartuIdentitas;
        val.nomorKartuIdentitas = int.parse(nomorKartuIdentitas);
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeBank({
    required String nomorRekening,
    required String namaRekening,
  }) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'nomor_rekening': nomorRekening,
      'nama_rekening': namaRekening,
    });
    if (success) {
      user.update((val) {
        val!.nomorRekening = int.parse(nomorRekening);
        val.namaRekening = namaRekening;
      });
      return true;
    } else {
      return false;
    }
  }
}
