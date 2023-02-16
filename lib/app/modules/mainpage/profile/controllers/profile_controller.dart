import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ziswaf/app/data/models/bank_yayasan_model.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/bank_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';
import 'package:mobile_ziswaf/app/utils/shared_preferences.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController emailController;

  BankProvider bankProvider = BankProvider();
  UserProvider userProvider = UserProvider();

  RxList<BankYayasan?> bankyayasan = <BankYayasan>[].obs;
  Rx<User?> user = User().obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;
  RxBool loadingDelay = true.obs;

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  void onInit() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    emailController = TextEditingController();
    getbankyayasan();
    getProfile();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() {
    sharedPrefs.logout();
    EasyLoading.showSuccess('Berhasil keluar');
  }

  void getProfile() async {
    isLoading.value = true;
    user.value = await userProvider.profile();
    update();
    isLoading.value = false;
  }

  void getProfile2() async {
    user.value = await userProvider.profile();
    update();
  }

  void getProfile3() async {
    isLoading.value = true;
    user.value = await userProvider.profile();
    update();
    isLoading.value = false;
  }

  void getProfile4() async {
    isLoading2.value = true;
    user.value = await userProvider.profile();
    update();
    isLoading2.value = false;
  }

  getbankyayasan() async {
    bankyayasan.assignAll(await bankProvider.getbankyayasan());
    update();
  }

  Future<bool> changeName({required String nama}) async {
    isLoading2.value = true;

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
    isLoading2.value = true;

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
    isLoading2.value = true;

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

  Future<bool> changeKategori({required String kategori}) async {
    isLoading2.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'kategori': kategori,
    });
    if (success) {
      user.update((val) {
        val!.kategori = kategori;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeTingkat({required String tingkat}) async {
    isLoading2.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'tingkat': tingkat,
    });
    if (success) {
      user.update((val) {
        val!.tingkatRelawan = tingkat;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeIdentity(
      {String? jenisKartuIdentitas,
      String? nomorKartuIdentitas,
      String? foto,
      String? linkfoto}) async {
    isLoading.value = true;
    if (foto != null) {
      final fotoRef = firebaseStorage.ref('identitas-foto');
      final convertedFoto = File(foto);
      final fotoExt = extension(convertedFoto.path);
      final fireFoto = fotoRef.child('${_getRandomFileName()}.$fotoExt');
      await fireFoto.putFile(File(foto));
      linkfoto = await fireFoto.getDownloadURL();
    } else {
      linkfoto;
    }
    bool success = await userProvider.changeProfile(user.value!.id!, {
      'jenis_kartu_identitas': jenisKartuIdentitas,
      'nomor_kartu_identitas': nomorKartuIdentitas,
      'foto_kartu_identitas': linkfoto
    });

    if (success) {
      user.update((val) async {
        val!.jenisKartuIdentitas = jenisKartuIdentitas;
        val.nomorKartuIdentitas = nomorKartuIdentitas;
        val.fotoKartuIdentitas = linkfoto;

        // user.update((val) {});
      });

      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeBank({
    required String nomorRekening,
    required String namaRekening,
    required int bankId,
  }) async {
    isLoading.value = true;

    bool success = await userProvider.changeProfile(user.value!.id!, {
      'nomor_rekening': nomorRekening,
      'nama_rekening': namaRekening,
      'bank_id': bankId,
    });
    if (success) {
      user.update((val) {
        val!.nomorRekening = nomorRekening;
        val.namaRekening = namaRekening;
      });
      return true;
    } else {
      return false;
    }
  }

  String _getRandomFileName() =>
      '${DateTime.now().toUtc().toString()}-${Random().nextInt(8999) + 1000}';
}
