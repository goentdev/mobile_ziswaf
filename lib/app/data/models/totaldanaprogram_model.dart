class Totaldanaprogram {
  int? totalDanaProgram;

  Totaldanaprogram({this.totalDanaProgram});

  Totaldanaprogram.fromJson(Map<String, dynamic> json) {
    totalDanaProgram = json['totalDanaProgram'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalDanaProgram'] = totalDanaProgram;
    return data;
  }
}
