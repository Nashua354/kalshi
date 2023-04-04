class LoginModel {
  LoginModel({
    required this.memberId,
    required this.token,
  });

  String memberId;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        memberId: json["member_id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "member_id": memberId,
        "token": token,
      };
}
