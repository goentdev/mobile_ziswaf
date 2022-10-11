class User {
  String? nama;
  String? nomor;

  User({this.nama, this.nomor});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nomor = json['nomor'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama'] = nama;
    data['nomor'] = nomor;
    return data;
  }
}
