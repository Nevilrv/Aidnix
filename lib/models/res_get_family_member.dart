import 'dart:convert';

ResGetFamilyMemberApi resGetFamilyMemberApiFromJson(String str) => ResGetFamilyMemberApi.fromJson(json.decode(str));

String resGetFamilyMemberApiToJson(ResGetFamilyMemberApi data) => json.encode(data.toJson());

class ResGetFamilyMemberApi {
  bool? status;
  int? code;
  List<FamilyData>? data;
  String? message;
  dynamic extra;

  ResGetFamilyMemberApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetFamilyMemberApi.fromJson(Map<String, dynamic> json) => ResGetFamilyMemberApi(
    status: json["status"],
    code: json["code"],
    data: json["data"] == null ? [] : List<FamilyData>.from(json["data"]!.map((x) => FamilyData.fromJson(x))),
    message: json["message"],
    extra: json["extra"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "extra": extra,
  };
}

class FamilyData {
  String? name;
  int? age;
  String? relation;
  String? gender;
  String? note;
  String? phoneNumber;
  String? referenceId;
  ProfilePic? profilePic;

  FamilyData({
    this.name,
    this.age,
    this.relation,
    this.gender,
    this.note,
    this.phoneNumber,
    this.referenceId,
    this.profilePic,
  });

  factory FamilyData.fromJson(Map<String, dynamic> json) => FamilyData(
    name: json["name"],
    age: json["age"],
    relation: json["relation"],
    gender: json["gender"],
    note: json["note"],
    phoneNumber: json["phone_number"],
    referenceId: json["reference_id"],
    profilePic: json["profile_pic"] == null ? null : ProfilePic.fromJson(json["profile_pic"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "relation": relation,
    "gender": gender,
    "note": note,
    "phone_number": phoneNumber,
    "reference_id": referenceId,
    "profile_pic": profilePic?.toJson(),
  };
}

class ProfilePic {
  int? cacheValidity;

  ProfilePic({
    this.cacheValidity,
  });

  factory ProfilePic.fromJson(Map<String, dynamic> json) => ProfilePic(
    cacheValidity: json["cache_validity"],
  );

  Map<String, dynamic> toJson() => {
    "cache_validity": cacheValidity,
  };
}
