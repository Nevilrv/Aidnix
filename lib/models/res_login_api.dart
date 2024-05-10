import 'dart:convert';

ResLoginApi resLoginApiFromJson(String str) => ResLoginApi.fromJson(json.decode(str));

String resLoginApiToJson(ResLoginApi data) => json.encode(data.toJson());

class ResLoginApi {
  bool? status;
  int? code;
  LoginData? data;
  String? message;
  dynamic extra;

  ResLoginApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResLoginApi.fromJson(Map<String, dynamic> json) => ResLoginApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
        message: json["message"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
        "message": message,
        "extra": extra,
      };
}

class LoginData {
  String? otpToken;

  LoginData({
    this.otpToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        otpToken: json["otp_token"],
      );

  Map<String, dynamic> toJson() => {
        "otp_token": otpToken,
      };
}
