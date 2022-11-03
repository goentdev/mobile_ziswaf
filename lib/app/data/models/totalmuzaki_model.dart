class Totalmuzaki {
  int? totalMuzaki;

  Totalmuzaki({this.totalMuzaki});

  Totalmuzaki.fromJson(Map<String, dynamic> json) {
    totalMuzaki = json['total_muzaki'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_muzaki'] = totalMuzaki;
    return data;
  }
}
