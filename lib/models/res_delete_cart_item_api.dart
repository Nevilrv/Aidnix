import 'dart:convert';

ResDeleteCartItemApi resDeleteCartItemApiFromJson(String str) => ResDeleteCartItemApi.fromJson(json.decode(str));

String resDeleteCartItemApiToJson(ResDeleteCartItemApi data) => json.encode(data.toJson());

class ResDeleteCartItemApi {
  bool? status;
  int? code;
  DeleteCartItemData? data;
  String? message;
  dynamic extra;

  ResDeleteCartItemApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResDeleteCartItemApi.fromJson(Map<String, dynamic> json) => ResDeleteCartItemApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : DeleteCartItemData.fromJson(json["data"]),
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

class DeleteCartItemData {
  String? id;

  DeleteCartItemData({
    this.id,
  });

  factory DeleteCartItemData.fromJson(Map<String, dynamic> json) => DeleteCartItemData(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
