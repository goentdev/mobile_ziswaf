import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/pages/login_page.dart';

import '../theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final whatsappController = TextEditingController();
final passwordController = TextEditingController();
final cpasswordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  bool isLoading = false;
  bool showPassword = false;
  // ignore: prefer_typing_uninitialized_variables
  var confirmPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/Logo Ziswaf.png',
            width: 95.74,
            height: 24,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 41,
            width: 355,
            child: FloatingActionButton.extended(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              onPressed: () async {},
              label: Text(
                'Daftar',
                style: textMBold.copyWith(color: Colors.white),
              ),
              backgroundColor: primaryMain,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah memiliki akun? ',
                style: captionTextBold.copyWith(color: neutral80),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text(
                  'Masuk Sekarang',
                  style: captionTextBold.copyWith(color: primaryMain),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar',
                style: pageTitleBold.copyWith(color: neutral100),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Isi form di bawah untuk mendaftarkan akun',
                style: secondaryTextSemiBold.copyWith(color: neutral70),
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Nomor Whatsapp',
                    style: captionTextSemiBold.copyWith(color: neutral90)),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: whatsappController,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Nomor Whatsapp Tidak boleh Kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: neutral40,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: 'Masukan nomor Whatsapp',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kata Sandi',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (v) {
                  confirmPass = v;
                  if (v?.isEmpty ?? true) return 'Password wajib diisi';
                  if (v!.length < 8) return 'Minimum 8 Karakter';
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: neutral40,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  isDense: true,
                  hintText: 'Masukan Kata Sandi',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => showPassword = !showPassword),
                    child: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: neutral60,
                      size: 18,
                    ),
                  ),
                ),
                obscureText: !showPassword,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Minimum 8 karakter',
                style: overlineSemiBold.copyWith(color: neutral70),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Konfirmasi Kata Sandi',
                  style: captionTextSemiBold.copyWith(color: neutral90),
                ),
              ),
              TextFormField(
                controller: cpasswordController,
                validator: (v) {
                  if (v?.isEmpty ?? true) return 'Password wajib diisi';
                  if (v!.length < 8) return 'Minimum 8 Karakter';
                  if (v != confirmPass) {
                    return 'Kata sandi harus sama dengan yang diatas';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: neutral40,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  isDense: true,
                  hintText: 'Ketik ulang Kata sandi',
                  hintStyle: textMBold.copyWith(color: neutral60),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => showPassword = !showPassword),
                    child: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: neutral60,
                      size: 18,
                    ),
                  ),
                ),
                obscureText: !showPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

                  // confirmPass = v;
                  // if (v?.isEmpty ?? true) return 'Password wajib diisi';
                  // if (v!.length < 8) return 'Minimum 8 Karakter';
                  // return null;