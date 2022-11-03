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
  Bank? bank;
  String? createdAt;

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
      this.bank,
      this.createdAt});

  Transaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    userId = json['user_id'];
    muzakiId = json['muzaki_id'];
    totalTransaksi = json['total_transaksi'];
    nomorRekening = json['nomor_rekening'];
    namaRekening = json['nama_rekening'];
    nomorResi = json['nomor_resi'];
    buktiTransaksi = json['bukti_transaksi'];
    bank = json['bank_id'];
    createdAt = json['created_at'];
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
    data['bank_id'] = bank;
    data['created_at'] = createdAt;
    return data;
  }
}
