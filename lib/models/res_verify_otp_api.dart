import 'dart:convert';

ResVerifyOtpApi resVerifyOtpApiFromJson(String str) => ResVerifyOtpApi.fromJson(json.decode(str));

String resVerifyOtpApiToJson(ResVerifyOtpApi data) => json.encode(data.toJson());

class ResVerifyOtpApi {
  bool? status;
  int? code;
  Data? data;
  String? message;
  dynamic extra;

  ResVerifyOtpApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResVerifyOtpApi.fromJson(Map<String, dynamic> json) => ResVerifyOtpApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  String? externalId;
  String? sessionToken;
  bool? isNewUser;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  String? notificationToken;

  Data({
    this.externalId,
    this.sessionToken,
    this.isNewUser,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.notificationToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        externalId: json["external_id"],
        sessionToken: json["session_token"],
        isNewUser: json["is_new_user"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
        notificationToken: json["notification_token"],
      );

  Map<String, dynamic> toJson() => {
        "external_id": externalId,
        "session_token": sessionToken,
        "is_new_user": isNewUser,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
        "notification_token": notificationToken,
      };
}
