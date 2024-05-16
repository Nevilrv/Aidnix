import 'dart:convert';

ResCartDataDeleteApi resCartDataDeleteApiFromJson(String str) => ResCartDataDeleteApi.fromJson(json.decode(str));

String resCartDataDeleteApiToJson(ResCartDataDeleteApi data) => json.encode(data.toJson());

class ResCartDataDeleteApi {
  bool? status;
  int? code;
  DeleteCartData? data;
  String? message;
  dynamic extra;

  ResCartDataDeleteApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResCartDataDeleteApi.fromJson(Map<String, dynamic> json) => ResCartDataDeleteApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : DeleteCartData.fromJson(json["data"]),
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

class DeleteCartData {
  String? id;

  DeleteCartData({
    this.id,
  });

  factory DeleteCartData.fromJson(Map<String, dynamic> json) => DeleteCartData(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
