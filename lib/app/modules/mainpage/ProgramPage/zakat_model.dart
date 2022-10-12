class Zakat {
  String? jenisDonasi;

  Zakat({this.jenisDonasi});

  Zakat.fromJson(Map<String, dynamic> json) {
    jenisDonasi = json['jenis_zakat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['jenis_zakat'] = jenisDonasi;
    return data;
  }
}
