import 'dart:convert';

ResCartSummaryGetApi resCartSummaryGetApiFromJson(String str) => ResCartSummaryGetApi.fromJson(json.decode(str));

String resCartSummaryGetApiToJson(ResCartSummaryGetApi data) => json.encode(data.toJson());

class ResCartSummaryGetApi {
  bool? status;
  int? code;
  CartSummaryData? data;
  String? message;
  dynamic extra;

  ResCartSummaryGetApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResCartSummaryGetApi.fromJson(Map<String, dynamic> json) => ResCartSummaryGetApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : CartSummaryData.fromJson(json["data"]),
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

class CartSummaryData {
  String? referenceId;
  Lab? lab;
  int? totalPrice;
  int? totalItems;

  CartSummaryData({
    this.referenceId,
    this.lab,
    this.totalPrice,
    this.totalItems,
  });

  factory CartSummaryData.fromJson(Map<String, dynamic> json) => CartSummaryData(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        totalPrice: json["total_price"],
        totalItems: json["total_items"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "lab": lab?.toJson(),
        "total_price": totalPrice,
        "total_items": totalItems,
      };
}

class Lab {
  Image? image;

  Lab({
    this.image,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
      };
}

class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => {};
}
