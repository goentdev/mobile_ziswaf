import 'package:mobile_ziswaf/app/data/models/jenisdonasis_model.dart';

class Alokasidana {
  int? id;
  int? transaksiId;
  Jenisdonasis? jenisDonasi;
  int? nominal;
  int? dihapus;

  Alokasidana(
      {this.id,
      this.transaksiId,
      this.jenisDonasi,
      this.nominal,
      this.dihapus});

  Alokasidana.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transaksiId = json['transaksi_id'];
    jenisDonasi = Jenisdonasis.fromJson(json['jenisDonasis']);
    nominal = json['nominal'];
    dihapus = json['dihapus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transaksi_id'] = transaksiId;
    data['jenisDonasis'] = jenisDonasi;
    data['nominal'] = nominal;
    data['dihapus'] = dihapus;
    return data;
  }
}
