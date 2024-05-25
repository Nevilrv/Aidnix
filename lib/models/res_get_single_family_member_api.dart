import 'dart:convert';
import 'package:aidnix/models/res_get_family_member.dart';

ResGetSingleFamilyMemberApi resGetSingleFamilyMemberApiFromJson(String str) => ResGetSingleFamilyMemberApi.fromJson(json.decode(str));

String resGetSingleFamilyMemberApiToJson(ResGetSingleFamilyMemberApi data) => json.encode(data.toJson());

class ResGetSingleFamilyMemberApi {
  bool? status;
  int? code;
  FamilyData? data;
  String? message;
  dynamic extra;

  ResGetSingleFamilyMemberApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetSingleFamilyMemberApi.fromJson(Map<String, dynamic> json) => ResGetSingleFamilyMemberApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : FamilyData.fromJson(json["data"]),
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
