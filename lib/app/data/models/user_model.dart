import 'package:mobile_ziswaf/app/data/models/bank_model.dart';

class User {
  int? id;
  int? status;
  String? nama;
  String? email;
  String? otp;
  String? whatsapp;
  String? role;
  String? kategori;
  String? jenisKartuIdentitas;
  String? nomorKartuIdentitas;
  // Bank? bank;
  String? nomorRekening;
  String? namaRekening;
  String? fotoKartuIdentitas;
  String? tingkatRelawan;

  User({
    this.id,
    this.nama,
    this.email,
    this.otp,
    this.status,
    this.whatsapp,
    this.role,
    this.kategori,
    this.jenisKartuIdentitas,
    this.nomorKartuIdentitas,
    this.fotoKartuIdentitas,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    nama = json['nama'];
    email = json['email'];
    otp = json['otp'];
    whatsapp = json['whatsapp'];
    role = json['role'];
    kategori = json['relawan']['kategori'];
    jenisKartuIdentitas = json['relawan']['jenis_kartu_identitas'];
    nomorKartuIdentitas = json['relawan']['nomor_kartu_identitas'];
    fotoKartuIdentitas = json['relawan']['foto_kartu_identitas'];
    tingkatRelawan = json['relawan']['tingkat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['nama'] = nama;
    data['email'] = email;
    data['otp'] = otp;
    data['whatsapp'] = whatsapp;
    data['role'] = role;
    data['kategori'] = kategori;
    data['jenis_kartu_identitas'] = jenisKartuIdentitas;
    data['nomor_kartu_identitas'] = nomorKartuIdentitas;
    data['foto_kartu_identitas'] = fotoKartuIdentitas;
    data['tingkat'] = tingkatRelawan;
    return data;
  }
}
