import 'dart:convert';

ResAddFamilyMemberImageApi resAddFamilyMemberImageApiFromJson(String str) => ResAddFamilyMemberImageApi.fromJson(json.decode(str));

String resAddFamilyMemberImageApiToJson(ResAddFamilyMemberImageApi data) => json.encode(data.toJson());

class ResAddFamilyMemberImageApi {
  bool? status;
  int? code;
  ImageData? data;
  String? message;
  dynamic extra;

  ResAddFamilyMemberImageApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResAddFamilyMemberImageApi.fromJson(Map<String, dynamic> json) => ResAddFamilyMemberImageApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : ImageData.fromJson(json["data"]),
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

class ImageData {
  String? docId;
  String? url;
  String? method;

  ImageData({
    this.docId,
    this.url,
    this.method,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        docId: json["doc_id"],
        url: json["url"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "url": url,
        "method": method,
      };
}
