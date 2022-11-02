class Program {
  int? id;
  String? nama;
  int? targetDana;
  String? tanggal;
  String? deskripsi;
  dynamic gambar;
  dynamic file;
  dynamic banner;
  dynamic totalDana;
  int? totalMuzaki;
  String? persen;

  Program(
      {this.id,
      this.nama,
      this.targetDana,
      this.tanggal,
      this.deskripsi,
      this.gambar,
      this.file,
      this.banner,
      this.totalDana,
      this.totalMuzaki,
      this.persen});

  Program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    targetDana = json['target_dana'];
    tanggal = json['tanggal'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    file = json['file'];
    banner = json['banner'];
    totalDana = json['totalDana'];
    totalMuzaki = json['totalMuzaki'];
    persen = json['persen'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['target_dana'] = targetDana;
    data['tanggal'] = tanggal;
    data['deskripsi'] = deskripsi;
    data['gambar'] = gambar;
    data['file'] = file;
    data['banner'] = banner;
    data['totalDana'] = totalDana;
    data['totalMuzaki'] = totalMuzaki;
    data['persen'] = persen;
    return data;
  }
}
