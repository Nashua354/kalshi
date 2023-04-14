class BalanceModel {
  int balance;
  BalanceModel({required this.balance});

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      BalanceModel(balance: json["balance"]);
}
