import 'dart:convert';

ResHomeApi resHomeApiFromJson(String str) => ResHomeApi.fromJson(json.decode(str));

String resHomeApiToJson(ResHomeApi data) => json.encode(data.toJson());

class ResHomeApi {
  bool? status;
  int? code;
  HomeData? data;
  String? message;
  Extra? extra;

  ResHomeApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResHomeApi.fromJson(Map<String, dynamic> json) => ResHomeApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : HomeData.fromJson(json["data"]),
        message: json["message"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
        "message": message,
        "extra": extra?.toJson(),
      };
}

class HomeData {
  BookingHelp? firstTimeOffer;
  BookingHelp? bookingHelp;
  ChatOrChatHelp? chatOrChatHelp;
  List<NearbyLab>? nearbyLabs;
  List<TestCategory>? testCategories;
  List<Campaign>? campaigns;
  BookingHelp? otherOffers;
  List<Review>? reviews;
  String? bottomImage;
  CartSummary? cartSummary;

  HomeData({
    this.firstTimeOffer,
    this.bookingHelp,
    this.chatOrChatHelp,
    this.nearbyLabs,
    this.testCategories,
    this.campaigns,
    this.otherOffers,
    this.reviews,
    this.bottomImage,
    this.cartSummary,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        firstTimeOffer: json["first_time_offer"] == null ? null : BookingHelp.fromJson(json["first_time_offer"]),
        bookingHelp: json["booking_help"] == null ? null : BookingHelp.fromJson(json["booking_help"]),
        chatOrChatHelp: json["chat_or_chat_help"] == null ? null : ChatOrChatHelp.fromJson(json["chat_or_chat_help"]),
        nearbyLabs: json["nearby_labs"] == null ? [] : List<NearbyLab>.from(json["nearby_labs"]!.map((x) => NearbyLab.fromJson(x))),
        testCategories:
            json["test_categories"] == null ? [] : List<TestCategory>.from(json["test_categories"]!.map((x) => TestCategory.fromJson(x))),
        campaigns: json["campaigns"] == null ? [] : List<Campaign>.from(json["campaigns"]!.map((x) => Campaign.fromJson(x))),
        otherOffers: json["other_offers"] == null ? null : BookingHelp.fromJson(json["other_offers"]),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
        bottomImage: json["bottom_image"],
        cartSummary: json["cart_summary"] == null ? null : CartSummary.fromJson(json["cart_summary"]),
      );

  Map<String, dynamic> toJson() => {
        "first_time_offer": firstTimeOffer?.toJson(),
        "booking_help": bookingHelp?.toJson(),
        "chat_or_chat_help": chatOrChatHelp?.toJson(),
        "nearby_labs": nearbyLabs == null ? [] : List<dynamic>.from(nearbyLabs!.map((x) => x.toJson())),
        "test_categories": testCategories == null ? [] : List<dynamic>.from(testCategories!.map((x) => x.toJson())),
        "campaigns": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x.toJson())),
        "other_offers": otherOffers?.toJson(),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "bottom_image": bottomImage,
        "cart_summary": cartSummary?.toJson(),
      };
}

class BookingHelp {
  String? id;
  String? title;
  String? subtitle;
  BookingHelpImage? image;
  bool? clickable;
  Cta? cta;
  List<BookingHelpButton>? buttons;
  String? discountTag;

  BookingHelp({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.clickable,
    this.cta,
    this.buttons,
    this.discountTag,
  });

  factory BookingHelp.fromJson(Map<String, dynamic> json) => BookingHelp(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"] == null ? null : BookingHelpImage.fromJson(json["image"]),
        clickable: json["clickable"],
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
        buttons: json["buttons"] == null ? [] : List<BookingHelpButton>.from(json["buttons"]!.map((x) => BookingHelpButton.fromJson(x))),
        discountTag: json["discount_tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image?.toJson(),
        "clickable": clickable,
        "cta": cta?.toJson(),
        "buttons": buttons == null ? [] : List<dynamic>.from(buttons!.map((x) => x.toJson())),
        "discount_tag": discountTag,
      };
}

class BookingHelpButton {
  CtaTitleImage? titleImage;
  String? title;

  BookingHelpButton({
    this.titleImage,
    this.title,
  });

  factory BookingHelpButton.fromJson(Map<String, dynamic> json) => BookingHelpButton(
        titleImage: json["title_image"] == null ? null : CtaTitleImage.fromJson(json["title_image"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title_image": titleImage?.toJson(),
        "title": title,
      };
}

class CtaTitleImage {
  CtaTitleImage();

  factory CtaTitleImage.fromJson(Map<String, dynamic> json) => CtaTitleImage();

  Map<String, dynamic> toJson() => {};
}

class Cta {
  CtaTitleImage? titleImage;

  Cta({
    this.titleImage,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
        titleImage: json["title_image"] == null ? null : CtaTitleImage.fromJson(json["title_image"]),
      );

  Map<String, dynamic> toJson() => {
        "title_image": titleImage?.toJson(),
      };
}

class BookingHelpImage {
  String? code;

  BookingHelpImage({
    this.code,
  });

  factory BookingHelpImage.fromJson(Map<String, dynamic> json) => BookingHelpImage(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Campaign {
  String? referenceId;
  CampaignLab? lab;
  String? title;
  String? detail;
  int? totalItems;
  int? amount;
  int? discount;
  int? totalPrice;
  String? discountTag;
  String? expiry;
  String? reportTime;
  String? appointmentType;

  Campaign({
    this.referenceId,
    this.lab,
    this.title,
    this.detail,
    this.totalItems,
    this.amount,
    this.discount,
    this.totalPrice,
    this.discountTag,
    this.expiry,
    this.reportTime,
    this.appointmentType,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : CampaignLab.fromJson(json["lab"]),
        title: json["title"],
        detail: json["detail"],
        totalItems: json["total_items"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        discountTag: json["discount_tag"],
        expiry: json["expiry"],
        reportTime: json["report_time"],
        appointmentType: json["appointment_type"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "lab": lab?.toJson(),
        "title": title,
        "detail": detail,
        "total_items": totalItems,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "discount_tag": discountTag,
        "expiry": expiry,
        "report_time": reportTime,
        "appointment_type": appointmentType,
      };
}

class CampaignLab {
  String? referenceId;
  String? name;
  CtaTitleImage? image;
  String? address;
  Distance? distance;

  CampaignLab({
    this.referenceId,
    this.name,
    this.image,
    this.address,
    this.distance,
  });

  factory CampaignLab.fromJson(Map<String, dynamic> json) => CampaignLab(
        referenceId: json["reference_id"],
        name: json["name"],
        image: json["image"] == null ? null : CtaTitleImage.fromJson(json["image"]),
        address: json["address"],
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "image": image?.toJson(),
        "address": address,
        "distance": distance?.toJson(),
      };
}

class Distance {
  double? value;
  String? unit;

  Distance({
    this.value,
    this.unit,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        value: json["value"]?.toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}

class CartSummary {
  String? referenceId;
  CartSummaryLab? lab;
  int? totalPrice;
  int? totalItems;

  CartSummary({
    this.referenceId,
    this.lab,
    this.totalPrice,
    this.totalItems,
  });

  factory CartSummary.fromJson(Map<String, dynamic> json) => CartSummary(
        referenceId: json["reference_id"],
        lab: json["lab"] == null ? null : CartSummaryLab.fromJson(json["lab"]),
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

class CartSummaryLab {
  String? referenceId;
  String? name;
  CtaTitleImage? image;

  CartSummaryLab({
    this.referenceId,
    this.name,
    this.image,
  });

  factory CartSummaryLab.fromJson(Map<String, dynamic> json) => CartSummaryLab(
        referenceId: json["reference_id"],
        name: json["name"],
        image: json["image"] == null ? null : CtaTitleImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "image": image?.toJson(),
      };
}

class ChatOrChatHelp {
  String? id;
  String? title;
  String? subtitle;
  BookingHelpImage? image;
  Cta? cta;
  List<ChatOrChatHelpButton>? buttons;

  ChatOrChatHelp({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.cta,
    this.buttons,
  });

  factory ChatOrChatHelp.fromJson(Map<String, dynamic> json) => ChatOrChatHelp(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"] == null ? null : BookingHelpImage.fromJson(json["image"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
        buttons:
            json["buttons"] == null ? [] : List<ChatOrChatHelpButton>.from(json["buttons"]!.map((x) => ChatOrChatHelpButton.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image?.toJson(),
        "cta": cta?.toJson(),
        "buttons": buttons == null ? [] : List<dynamic>.from(buttons!.map((x) => x.toJson())),
      };
}

class ChatOrChatHelpButton {
  BookingHelpImage? titleImage;
  String? title;

  ChatOrChatHelpButton({
    this.titleImage,
    this.title,
  });

  factory ChatOrChatHelpButton.fromJson(Map<String, dynamic> json) => ChatOrChatHelpButton(
        titleImage: json["title_image"] == null ? null : BookingHelpImage.fromJson(json["title_image"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title_image": titleImage?.toJson(),
        "title": title,
      };
}

class NearbyLab {
  String? referenceId;
  String? name;
  String? email;
  String? openTime;
  String? closeTime;
  BookingHelpImage? image;
  String? description;
  DateTime? establishDate;
  String? address;
  int? pickupCharge;
  Distance? distance;
  String? reviews;
  String? totalTests;
  bool? recommended;
  int? pickupChargeDiscount;

  NearbyLab({
    this.referenceId,
    this.name,
    this.email,
    this.openTime,
    this.closeTime,
    this.image,
    this.description,
    this.establishDate,
    this.address,
    this.pickupCharge,
    this.distance,
    this.reviews,
    this.totalTests,
    this.recommended,
    this.pickupChargeDiscount,
  });

  factory NearbyLab.fromJson(Map<String, dynamic> json) => NearbyLab(
        referenceId: json["reference_id"],
        name: json["name"],
        email: json["email"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        image: json["image"] == null ? null : BookingHelpImage.fromJson(json["image"]),
        description: json["description"],
        establishDate: json["establish_date"] == null ? null : DateTime.parse(json["establish_date"]),
        address: json["address"],
        pickupCharge: json["pickup_charge"],
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
        reviews: json["reviews"],
        totalTests: json["total_tests"],
        recommended: json["recommended"],
        pickupChargeDiscount: json["pickup_charge_discount"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "email": email,
        "open_time": openTime,
        "close_time": closeTime,
        "image": image?.toJson(),
        "description": description,
        "establish_date":
            "${establishDate!.year.toString().padLeft(4, '0')}-${establishDate!.month.toString().padLeft(2, '0')}-${establishDate!.day.toString().padLeft(2, '0')}",
        "address": address,
        "pickup_charge": pickupCharge,
        "distance": distance?.toJson(),
        "reviews": reviews,
        "total_tests": totalTests,
        "recommended": recommended,
        "pickup_charge_discount": pickupChargeDiscount,
      };
}

class Review {
  BookingHelpImage? image;
  String? name;
  String? review;
  String? location;
  double? rating;

  Review({
    this.image,
    this.name,
    this.review,
    this.location,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        image: json["image"] == null ? null : BookingHelpImage.fromJson(json["image"]),
        name: json["name"],
        review: json["review"],
        location: json["location"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "name": name,
        "review": review,
        "location": location,
        "rating": rating,
      };
}

class TestCategory {
  String? referenceId;
  String? name;
  BookingHelpImage? image;
  Cta? cta;

  TestCategory({
    this.referenceId,
    this.name,
    this.image,
    this.cta,
  });

  factory TestCategory.fromJson(Map<String, dynamic> json) => TestCategory(
        referenceId: json["reference_id"],
        name: json["name"],
        image: json["image"] == null ? null : BookingHelpImage.fromJson(json["image"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "image": image?.toJson(),
        "cta": cta?.toJson(),
      };
}

class Extra {
  int? cartCount;
  int? notificationCount;

  Extra({
    this.cartCount,
    this.notificationCount,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        cartCount: json["cart_count"],
        notificationCount: json["notification_count"],
      );

  Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
        "notification_count": notificationCount,
      };
}
