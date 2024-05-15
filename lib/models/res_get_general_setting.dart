import 'dart:convert';

ResGetGeneralSetting resGetGeneralSettingFromJson(String str) => ResGetGeneralSetting.fromJson(json.decode(str));

String resGetGeneralSettingToJson(ResGetGeneralSetting data) => json.encode(data.toJson());

class ResGetGeneralSetting {
  bool? status;
  int? code;
  ProfileData? data;
  String? message;
  dynamic extra;

  ResGetGeneralSetting({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetGeneralSetting.fromJson(Map<String, dynamic> json) => ResGetGeneralSetting(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
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

class ProfileData {
  String? email;
  String? gender;
  ProfilePic? profilePic;

  ProfileData({
    this.email,
    this.gender,
    this.profilePic,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        email: json["email"],
        gender: json["gender"],
        profilePic: json["profile_pic"] == null ? null : ProfilePic.fromJson(json["profile_pic"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "gender": gender,
        "profile_pic": profilePic?.toJson(),
      };
}

class ProfilePic {
  String? id;
  int? cacheValidity;

  ProfilePic({
    this.id,
    this.cacheValidity,
  });

  factory ProfilePic.fromJson(Map<String, dynamic> json) => ProfilePic(
        id: json["id"],
        cacheValidity: json["cache_validity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cache_validity": cacheValidity,
      };
}
