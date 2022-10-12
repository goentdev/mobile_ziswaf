class User {
  String? nama;
  String? email;
  String? whatsapp;
  String? role;
  String? kategori;
  String? jenisKartuIdentitas;
  String? nomorKartuIdentitas;
  int? bankId;
  String? nomorRekening;
  String? namaRekening;

  User(
      {this.nama,
      this.email,
      this.whatsapp,
      this.role,
      this.kategori,
      this.jenisKartuIdentitas,
      this.nomorKartuIdentitas,
      this.bankId,
      this.nomorRekening,
      this.namaRekening});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    role = json['role'];
    kategori = json['relawan']['kategori'];
    jenisKartuIdentitas = json['relawan']['jenis_kartu_identitas'];
    nomorKartuIdentitas = json['relawan']['nomor_kartu_identitas'];
    bankId = json['relawan']['bank_id'];
    nomorRekening = json['relawan']['nomor_rekening'];
    namaRekening = json['relawan']['nama_rekening'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['whatsapp'] = whatsapp;
    data['role'] = role;
    data['kategori'] = kategori;
    data['jenis_kartu_identitas'] = jenisKartuIdentitas;
    data['nomor_kartu_identitas'] = nomorKartuIdentitas;
    data['bank_id'] = bankId;
    data['nomor_rekening'] = nomorRekening;
    data['nama_rekening'] = namaRekening;
    return data;
  }
}
