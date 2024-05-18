import 'dart:convert';

import 'package:aidnix/models/res_home_api.dart';

ResGetAllLabs resGetAllLabsFromJson(String str) => ResGetAllLabs.fromJson(json.decode(str));

String resGetAllLabsToJson(ResGetAllLabs data) => json.encode(data.toJson());

class ResGetAllLabs {
  bool? status;
  int? code;
  List<NearbyLab>? data;
  String? message;
  dynamic extra;

  ResGetAllLabs({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetAllLabs.fromJson(Map<String, dynamic> json) => ResGetAllLabs(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<NearbyLab>.from(json["data"]!.map((x) => NearbyLab.fromJson(x))),
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
