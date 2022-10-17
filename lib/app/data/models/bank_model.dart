class Bank {
  int? id;
  String? nama;
  String? value;
  String? image;

  Bank({this.id, this.nama, this.value, this.image});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    value = json['value'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['value'] = value;
    data['image'] = image;
    return data;
  }
}
