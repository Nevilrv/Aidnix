import 'dart:convert';

ResAddFamilyMemberApi resAddFamilyMemberApiFromJson(String str) => ResAddFamilyMemberApi.fromJson(json.decode(str));

String resAddFamilyMemberApiToJson(ResAddFamilyMemberApi data) => json.encode(data.toJson());

class ResAddFamilyMemberApi {
  bool? status;
  int? code;
  AddFamilyData? data;
  String? message;
  dynamic extra;

  ResAddFamilyMemberApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResAddFamilyMemberApi.fromJson(Map<String, dynamic> json) => ResAddFamilyMemberApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : AddFamilyData.fromJson(json["data"]),
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

class AddFamilyData {
  String? id;

  AddFamilyData({
    this.id,
  });

  factory AddFamilyData.fromJson(Map<String, dynamic> json) => AddFamilyData(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
