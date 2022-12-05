import 'package:mobile_ziswaf/app/data/models/alokasidana_model.dart';
import 'package:mobile_ziswaf/app/data/models/muzaki_model.dart';

import 'bank_model.dart';

class Transaksi {
  int? id;
  int? programId;
  int? userId;
  int? muzakiId;
  int? totalTransaksi;
  String? nomorRekening;
  String? namaRekening;
  String? nomorResi;
  String? buktiTransaksi;
  String? kuitansi;
  Alokasidana? sertifikat;
  int? bankid;
  int? konfirmasi;
  String? createdAt;
  MuzakiUserModel? muzaki;
  Bank? bank;
  String? kategori;

  Transaksi(
      {this.id,
      this.programId,
      this.userId,
      this.muzakiId,
      this.totalTransaksi,
      this.nomorRekening,
      this.namaRekening,
      this.nomorResi,
      this.buktiTransaksi,
      this.bankid,
      this.createdAt,
      this.muzaki,
      this.bank,
      this.konfirmasi,
      this.kuitansi,
      this.sertifikat,
      this.kategori});

  Transaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    userId = json['user_id'];
    muzakiId = json['muzaki_id'];
    totalTransaksi = json['total_transaksi'] ?? 0;
    nomorRekening = json['nomor_rekening'] ?? 'Data belum di isi';
    namaRekening = json['nama_rekening'] ?? 'Data belum di isi';
    nomorResi = json['nomor_resi'] ?? 'Data belum di isi';
    buktiTransaksi = json['bukti_transaksi'] ?? 'Data belum di isi';
    kuitansi = json['kuitansi'] ?? 'Belum Ada Data';
    sertifikat = json['alokasiDana'] != null
        ? Alokasidana?.fromJson(json['muzaki'])
        : null;
    bankid = json['bank_id'] ?? 0;
    konfirmasi = json['konfirmasi'] ?? 0;
    createdAt = json['created_at'];
    muzaki = json['muzaki'] != null
        ? MuzakiUserModel?.fromJson(json['muzaki'])
        : null;
    bank = json['bank'] != null ? Bank?.fromJson(json['bank']) : null;
    kategori = json['muzaki']['muzaki']['kategori'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['user_id'] = userId;
    data['muzaki_id'] = muzakiId;
    data['total_transaksi'] = totalTransaksi;
    data['nomor_rekening'] = nomorRekening;
    data['nama_rekening'] = namaRekening;
    data['nomor_resi'] = nomorResi;
    data['bukti_transaksi'] = buktiTransaksi;
    data['kuitansi'] = kuitansi;
    data['bank_id'] = bankid;
    data['konfirmasi'] = konfirmasi;
    data['created_at'] = createdAt;
    if (muzaki != null) {
      data['muzaki'] = muzaki?.toJson();
    }
    if (bank != null) {
      data['bank'] = bank?.toJson();
    }
    if (sertifikat != null) {
      data['alokasiDana'] = sertifikat?.toJson();
    }
    data['kategori'] = kategori;
    return data;
  }
}
