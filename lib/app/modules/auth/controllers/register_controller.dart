import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';

class RegisterController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  late TextEditingController confirmC;
  late TextEditingController otp;
  // final loginFormKey = GlobalKey<FormState>();
  final AuthProvider authProvider = AuthProvider();

  final registerFormKey = GlobalKey<FormState>();
  Rx<User?> user = User().obs;

  RxBool isLoading = false.obs;
  RxBool showPassword = true.obs;

  @override
  void onInit() {
    whatsappC = TextEditingController();
    passwordC = TextEditingController();
    confirmC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    whatsappC.dispose();
    passwordC.dispose();
    confirmC.dispose();
    super.onClose();
  }

  void changeShowPassword() {
    showPassword.value = !showPassword.value;
  }

  Future<bool> register({
    required String nama,
    required String email,
    // required String otp,
    required String whatsapp,
    required String role,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required String fotoKartuIdentitas,
    required int bankId,
    required String nomorRekening,
    required String namaRekening,
    required String password,
  }) async {
    isLoading.value = true;

    return await authProvider.register(
        bankId: bankId,
        // nama: nama,
        // email: email,
        // otp: otp,
        whatsapp: whatsapp,
        role: role,
        // kategori: kategori,
        // jenisKartuIdentitas: jenisKartuIdentitas,
        // nomorKartuIdentitas: nomorKartuIdentitas,
        // fotoKartuIdentitas: fotoKartuIdentitas,
        // bankId: bankId,
        // nomorRekening: nomorRekening,
        // namaRekening: namaRekening,
        password: password,
        email: email,
        fotoKartuIdentitas: fotoKartuIdentitas,
        jenisKartuIdentitas: jenisKartuIdentitas,
        kategori: kategori,
        nama: nama,
        namaRekening: namaRekening,
        nomorKartuIdentitas: nomorKartuIdentitas,
        nomorRekening: nomorRekening);
  }

  Future<bool> registupdate({
    required String nama,
    required String email,
    required String otp,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required String fotoKartuIdentitas,
    required int bankId,
    required String nomorRekening,
    required String namaRekening,
  }) async {
    bool sukses = await authProvider.registupdate(user.value!.id!, {
      "nama": nama,
      "email": email,
      "kategori": kategori,
      "jenis_kartu_identitas": jenisKartuIdentitas,
      "nomor_kartu_identitas": nomorKartuIdentitas,
      "foto_kartu_identitas": fotoKartuIdentitas,
      "bank": bankId,
      "nomor_rekening": nomorRekening,
      "nama_rekening": namaRekening,
    });
    if (sukses) {
      user.update((val) {
        val!.nama = nama;
        val.email = email;
        val.kategori = kategori;
        val.jenisKartuIdentitas = jenisKartuIdentitas;
        val.nomorKartuIdentitas = nomorKartuIdentitas;
        val.fotoKartuIdentitas = fotoKartuIdentitas;
        val.bank!.id = bankId;
        val.fotoKartuIdentitas = fotoKartuIdentitas;
        val.fotoKartuIdentitas = fotoKartuIdentitas;
      });
      return true;
    } else {
      return false;
    }
  }
}
