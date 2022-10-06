import 'package:flutter/material.dart';
import 'package:mobile_ziswaf/pages/otp_sms_page.dart';
import 'package:mobile_ziswaf/pages/pilihbank_page..dart';
import 'package:mobile_ziswaf/theme.dart';

import 'package:mobile_ziswaf/widget/button.dart';
import 'package:mobile_ziswaf/widget/tambah_foto_button.dart';

class IdentitasPage extends StatefulWidget {
  const IdentitasPage({super.key});

  @override
  State<IdentitasPage> createState() => _IdentitasPageState();
}

class _IdentitasPageState extends State<IdentitasPage> {
  List<String> listnama = ['KTP', 'SIM', 'Paspor'];
  late String selectedvalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedvalue = listnama.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Masukan Kartu Identitas Diri',
          style: listTitleBold.copyWith(color: neutral90),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral90,
            size: 10,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Jenis Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listnama[index],
                          style: captionTextSemiBold.copyWith(color: neutral80),
                        ),
                        Radio(
                          activeColor: primaryMain,
                          value: listnama[index],
                          groupValue: selectedvalue,
                          onChanged: (value) {
                            selectedvalue = value!;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: neutral30,
                      thickness: 1,
                      height: 8,
                    ),
                  ],
                );
              },
              itemCount: listnama.length,
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: neutral30, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Masukkan nomor kartu identitas',
                hintStyle: textMBold.copyWith(color: neutral60),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Foto Kartu Identitas',
                style: captionTextSemiBold.copyWith(color: neutral90),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TambahFotoButton(
              ontap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
                textbutton: 'Selanjutnya',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PilihBank(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
