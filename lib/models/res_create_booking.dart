import 'dart:convert';

ResCreateBooking resCreateBookingFromJson(String str) => ResCreateBooking.fromJson(json.decode(str));

String resCreateBookingToJson(ResCreateBooking data) => json.encode(data.toJson());

class ResCreateBooking {
  bool? status;
  int? code;
  CreateBookingData? data;
  String? message;
  dynamic extra;

  ResCreateBooking({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResCreateBooking.fromJson(Map<String, dynamic> json) => ResCreateBooking(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : CreateBookingData.fromJson(json["data"]),
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

class CreateBookingData {
  String? referenceId;
  Lab? lab;
  int? totalItems;
  int? amount;
  int? discount;
  int? totalPrice;
  String? title;
  String? subTitle;
  String? scheduledAt;
  String? status;
  List<PaymentMethod>? paymentMethods;

  CreateBookingData({
    this.referenceId,
    this.lab,
    this.totalItems,
    this.amount,
    this.discount,
    this.totalPrice,
    this.title,
    this.subTitle,
    this.scheduledAt,
    this.status,
    this.paymentMethods,
  });

  factory CreateBookingData.fromJson(Map<String, dynamic> json) => CreateBookingData(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        totalItems: json["total_items"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        title: json["title"],
        subTitle: json["sub_title"],
        scheduledAt: json["scheduled_at"],
        status: json["status"],
        paymentMethods:
            json["payment_methods"] == null ? [] : List<PaymentMethod>.from(json["payment_methods"]!.map((x) => PaymentMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "lab": lab?.toJson(),
        "total_items": totalItems,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "title": title,
        "sub_title": subTitle,
        "scheduled_at": scheduledAt,
        "status": status,
        "payment_methods": paymentMethods == null ? [] : List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
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

class PaymentMethod {
  String? title;
  String? value;

  PaymentMethod({
    this.title,
    this.value,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
      };
}
