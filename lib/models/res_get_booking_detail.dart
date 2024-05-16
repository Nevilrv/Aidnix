import 'dart:convert';

ResGetBookingDetails resGetBookingDetailsFromJson(String str) => ResGetBookingDetails.fromJson(json.decode(str));

String resGetBookingDetailsToJson(ResGetBookingDetails data) => json.encode(data.toJson());

class ResGetBookingDetails {
  bool? status;
  int? code;
  BookingData? data;
  String? message;
  dynamic extra;

  ResGetBookingDetails({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetBookingDetails.fromJson(Map<String, dynamic> json) => ResGetBookingDetails(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : BookingData.fromJson(json["data"]),
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

class BookingData {
  String? referenceId;
  Lab? lab;
  int? totalItems;
  int? amount;
  int? discount;
  int? totalPrice;
  String? scheduledAt;
  String? scheduleType;
  List<Status>? status;
  List<LabItem>? labItems;
  String? scheduledDate;
  String? scheduledTime;
  String? qrCode;

  BookingData({
    this.referenceId,
    this.lab,
    this.totalItems,
    this.amount,
    this.discount,
    this.totalPrice,
    this.scheduledAt,
    this.scheduleType,
    this.status,
    this.labItems,
    this.scheduledDate,
    this.scheduledTime,
    this.qrCode,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        totalItems: json["total_items"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        scheduledAt: json["scheduled_at"],
        scheduleType: json["schedule_type"],
        status: json["status"] == null ? [] : List<Status>.from(json["status"]!.map((x) => Status.fromJson(x))),
        labItems: json["lab_items"] == null ? [] : List<LabItem>.from(json["lab_items"]!.map((x) => LabItem.fromJson(x))),
        scheduledDate: json["scheduled_date"],
        scheduledTime: json["scheduled_time"],
        qrCode: json["qr_code"],
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
        "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toJson())),
        "lab_items": labItems == null ? [] : List<dynamic>.from(labItems!.map((x) => x.toJson())),
        "scheduled_date": scheduledDate,
        "scheduled_time": scheduledTime,
        "qr_code": qrCode,
      };
}

class Lab {
  String? name;
  LabImage? image;

  Lab({
    this.name,
    this.image,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        name: json["name"],
        image: json["image"] == null ? null : LabImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image?.toJson(),
      };
}

class LabImage {
  LabImage();

  factory LabImage.fromJson(Map<String, dynamic> json) => LabImage();

  Map<String, dynamic> toJson() => {};
}

class LabItem {
  String? referenceId;
  int? amount;
  int? discount;
  int? totalPrice;
  String? name;
  String? description;
  LabItemImage? image;

  LabItem({
    this.referenceId,
    this.amount,
    this.discount,
    this.totalPrice,
    this.name,
    this.description,
    this.image,
  });

  factory LabItem.fromJson(Map<String, dynamic> json) => LabItem(
        referenceId: json["reference_id"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        name: json["name"],
        description: json["description"],
        image: json["image"] == null ? null : LabItemImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "name": name,
        "description": description,
        "image": image?.toJson(),
      };
}

class LabItemImage {
  String? code;

  LabItemImage({
    this.code,
  });

  factory LabItemImage.fromJson(Map<String, dynamic> json) => LabItemImage(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Status {
  String? status;
  String? time;
  LabItemImage? image;

  Status({
    this.status,
    this.time,
    this.image,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        time: json["time"],
        image: json["image"] == null ? null : LabItemImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "time": time,
        "image": image?.toJson(),
      };
}
