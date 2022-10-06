class Bank {
  String? bank;
  String? logo;

  Bank({this.bank, this.logo});

  Bank.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bank'] = bank;
    data['logo'] = logo;
    return data;
  }
}
