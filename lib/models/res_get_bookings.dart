import 'dart:convert';

ResGetBookingHistory resGetBookingHistoryFromJson(String str) => ResGetBookingHistory.fromJson(json.decode(str));

String resGetBookingHistoryToJson(ResGetBookingHistory data) => json.encode(data.toJson());

class ResGetBookingHistory {
  bool? status;
  int? code;
  List<Booking>? data;
  String? message;
  dynamic extra;

  ResGetBookingHistory({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetBookingHistory.fromJson(Map<String, dynamic> json) => ResGetBookingHistory(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<Booking>.from(json["data"]!.map((x) => Booking.fromJson(x))),
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

class Booking {
  String? referenceId;
  Lab? lab;
  int? totalItems;
  int? amount;
  int? discount;
  int? totalPrice;
  String? scheduledAt;
  String? scheduleType;
  String? currentStatus;
  String? testNames;

  Booking({
    this.referenceId,
    this.lab,
    this.totalItems,
    this.amount,
    this.discount,
    this.totalPrice,
    this.scheduledAt,
    this.scheduleType,
    this.currentStatus,
    this.testNames,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        totalItems: json["total_items"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        scheduledAt: json["scheduled_at"],
        scheduleType: json["schedule_type"],
        currentStatus: json["current_status"],
        testNames: json["test_names"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "lab": lab?.toJson(),
        "total_items": totalItems,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "scheduled_at": scheduledAt,
        "schedule_type": scheduleType,
        "current_status": currentStatus,
        "test_names": testNames,
      };
}

class Lab {
  String? name;
  Image? image;

  Lab({
    this.name,
    this.image,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image?.toJson(),
      };
}

class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => {};
}
