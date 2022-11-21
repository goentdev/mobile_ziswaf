class Jenisdonasis {
  int? id;
  int? programId;
  String? nama;

  Jenisdonasis({this.id, this.programId, this.nama});

  Jenisdonasis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['nama'] = nama;
    return data;
  }
}
