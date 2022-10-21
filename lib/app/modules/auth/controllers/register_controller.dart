import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/providers/auth_provider.dart';

class RegisterController extends GetxController {
  late TextEditingController whatsappC;
  late TextEditingController passwordC;
  late TextEditingController confirmC;
  final loginFormKey = GlobalKey<FormState>();
  final AuthProvider authProvider = AuthProvider();

  final registerFormKey = GlobalKey<FormState>();

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
    required String whatsapp,
    required String role,
    required String kategori,
    required String jenisKartuIdentitas,
    required String nomorKartuIdentitas,
    required int bankId,
    required String nomorRekening,
    required String namaRekening,
    required String password,
  }) async {
    isLoading.value = true;

    return await authProvider.register(
        nama: nama,
        email: email,
        whatsapp: whatsapp,
        role: role,
        kategori: kategori,
        jenisKartuIdentitas: jenisKartuIdentitas,
        nomorKartuIdentitas: nomorKartuIdentitas,
        bankId: bankId,
        nomorRekening: nomorRekening,
        namaRekening: namaRekening,
        password: password);
  }
}
