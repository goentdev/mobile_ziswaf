import 'package:mobile_ziswaf/app/data/models/bank_model.dart';

class User {
  int? id;
  String? nama;
  String? email;
  String? whatsapp;
  String? role;
  String? kategori;
  String? jenisKartuIdentitas;
  String? nomorKartuIdentitas;
  Bank? bank;
  String? nomorRekening;
  String? namaRekening;
  String? fotoKartuIdentitas;

  User({
    this.id,
    this.nama,
    this.email,
    this.whatsapp,
    this.role,
    this.kategori,
    this.jenisKartuIdentitas,
    this.nomorKartuIdentitas,
    this.bank,
    this.nomorRekening,
    this.namaRekening,
    this.fotoKartuIdentitas,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    role = json['role'];
    kategori = json['relawan']['kategori'];
    jenisKartuIdentitas = json['relawan']['jenis_kartu_identitas'];
    nomorKartuIdentitas = json['relawan']['nomor_kartu_identitas'];
    bank = Bank.fromJson(json['relawan']['bank']);
    nomorRekening = json['relawan']['nomor_rekening'];
    namaRekening = json['relawan']['nama_rekening'];
    fotoKartuIdentitas = json['relawan']['foto_kartu_identitas'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['whatsapp'] = whatsapp;
    data['role'] = role;
    data['kategori'] = kategori;
    data['jenis_kartu_identitas'] = jenisKartuIdentitas;
    data['nomor_kartu_identitas'] = nomorKartuIdentitas;
    data['bank'] = bank;
    data['nomor_rekening'] = nomorRekening;
    data['nama_rekening'] = namaRekening;
    data['foto_kartu_identitas'] = fotoKartuIdentitas;
    return data;
  }
}
