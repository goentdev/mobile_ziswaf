class Muzaki {
  int? id;
  int? userId;
  int? muzakiId;
  String? tipe;
  String? nama;
  String? kategori;
  MuzakiUserModel? muzaki;

  Muzaki(
      {this.id,
      this.userId,
      this.muzakiId,
      this.tipe,
      this.nama,
      this.kategori,
      this.muzaki});

  Muzaki.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    muzakiId = json['muzaki_id'];
    tipe = json['tipe'];
    nama = json['nama'];
    kategori = json['kategori'];
    muzaki = json['muzaki'] != null
        ? MuzakiUserModel?.fromJson(json['muzaki'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['muzaki_id'] = muzakiId;
    data['tipe'] = tipe;
    data['nama'] = nama;
    data['kategori'] = kategori;
    if (muzaki != null) {
      data['muzaki'] = muzaki?.toJson();
    }
    return data;
  }
}

class MuzakiUserModel {
  int? id;
  String? nama;
  String? email;
  String? whatsapp;
  String? role;

  MuzakiUserModel({this.id, this.nama, this.email, this.whatsapp, this.role});

  MuzakiUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['whatsapp'] = whatsapp;
    data['role'] = role;
    return data;
  }
}
