import 'dart:convert';

ResCartDetailsGetApi resCartDetailsGetApiFromJson(String str) => ResCartDetailsGetApi.fromJson(json.decode(str));

String resCartDetailsGetApiToJson(ResCartDetailsGetApi data) => json.encode(data.toJson());

class ResCartDetailsGetApi {
  bool? status;
  int? code;
  CartData? data;
  String? message;
  dynamic extra;

  ResCartDetailsGetApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResCartDetailsGetApi.fromJson(Map<String, dynamic> json) => ResCartDetailsGetApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : CartData.fromJson(json["data"]),
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

class CartData {
  String? referenceId;
  Lab? lab;
  int? totalItems;
  int? amount;
  int? discount;
  int? totalPrice;
  List<LabItem>? labItems;
  bool? appointmentNeeded;

  CartData({
    this.referenceId,
    this.lab,
    this.totalItems,
    this.amount,
    this.discount,
    this.totalPrice,
    this.labItems,
    this.appointmentNeeded,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        totalItems: json["total_items"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        labItems: json["lab_items"] == null ? [] : List<LabItem>.from(json["lab_items"]!.map((x) => LabItem.fromJson(x))),
        appointmentNeeded: json["appointment_needed"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "lab": lab?.toJson(),
        "total_items": totalItems,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "lab_items": labItems == null ? [] : List<dynamic>.from(labItems!.map((x) => x.toJson())),
        "appointment_needed": appointmentNeeded,
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

class LabItem {
  String? referenceId;
  int? amount;
  int? discount;
  int? totalPrice;
  String? discountTag;
  String? name;
  String? description;
  dynamic image;

  LabItem({
    this.referenceId,
    this.amount,
    this.discount,
    this.totalPrice,
    this.discountTag,
    this.name,
    this.description,
    this.image,
  });

  factory LabItem.fromJson(Map<String, dynamic> json) => LabItem(
        referenceId: json["reference_id"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        discountTag: json["discount_tag"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "discount_tag": discountTag,
        "name": name,
        "description": description,
        "image": image,
      };
}
