class Alokasidana {
  int? id;
  int? transaksiId;
  String? jenisDonasi;
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
    jenisDonasi = json['jenis_donasi'];
    nominal = json['nominal'];
    dihapus = json['dihapus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transaksi_id'] = transaksiId;
    data['jenis_donasi'] = jenisDonasi;
    data['nominal'] = nominal;
    data['dihapus'] = dihapus;
    return data;
  }
}
