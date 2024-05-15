import 'dart:convert';

ResGetGeneralSetting resGetGeneralSettingFromJson(String str) => ResGetGeneralSetting.fromJson(json.decode(str));

String resGetGeneralSettingToJson(ResGetGeneralSetting data) => json.encode(data.toJson());

class ResGetGeneralSetting {
  bool? status;
  int? code;
  Data? data;
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
  ProfilePic? profilePic;

  Data({
    this.profilePic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profilePic: json["profile_pic"] == null ? null : ProfilePic.fromJson(json["profile_pic"]),
      );

  Map<String, dynamic> toJson() => {
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
