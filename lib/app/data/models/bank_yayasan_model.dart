import 'package:mobile_ziswaf/app/data/models/bank_model.dart';

class BankYayasan {
  int? id;
  String? nomorRekening;
  String? namaRekening;
  Bank? bank;

  BankYayasan({this.id, this.nomorRekening, this.namaRekening, this.bank});

  BankYayasan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomorRekening = json['nomor_rekening'];
    bank = Bank.fromJson(json['bank']);
    namaRekening = json['nama_rekening'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nomor_rekening'] = nomorRekening;
    data['nama_rekening'] = namaRekening;
    data['bank'] = bank;

    return data;
  }
}
