class Totaltransaksi {
  int? totalTransaksi;

  Totaltransaksi({this.totalTransaksi});

  Totaltransaksi.fromJson(Map<String, dynamic> json) {
    totalTransaksi = json['total_transaksi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_transaksi'] = totalTransaksi;
    return data;
  }
}
