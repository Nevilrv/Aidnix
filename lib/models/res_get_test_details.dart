import 'dart:convert';

ResGetTestDetails resGetTestDetailsFromJson(String str) => ResGetTestDetails.fromJson(json.decode(str));

String resGetTestDetailsToJson(ResGetTestDetails data) => json.encode(data.toJson());

class ResGetTestDetails {
  bool? status;
  int? code;
  TestDetail? data;
  String? message;
  dynamic extra;

  ResGetTestDetails({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetTestDetails.fromJson(Map<String, dynamic> json) => ResGetTestDetails(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : TestDetail.fromJson(json["data"]),
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

class TestDetail {
  String? referenceId;
  int? amount;
  int? discount;
  int? totalPrice;
  String? discountType;
  bool? homeVisit;
  int? reportTime;
  String? name;
  String? description;
  Test? test;
  Lab? lab;

  TestDetail({
    this.referenceId,
    this.amount,
    this.discount,
    this.totalPrice,
    this.discountType,
    this.homeVisit,
    this.reportTime,
    this.name,
    this.description,
    this.test,
    this.lab,
  });

  factory TestDetail.fromJson(Map<String, dynamic> json) => TestDetail(
        referenceId: json["reference_id"],
        amount: json["amount"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        discountType: json["discount_type"],
        homeVisit: json["home_visit"],
        reportTime: json["report_time"],
        name: json["name"],
        description: json["description"],
        test: json["test"] == null ? null : Test.fromJson(json["test"]),
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "discount_type": discountType,
        "home_visit": homeVisit,
        "report_time": reportTime,
        "name": name,
        "description": description,
        "test": test?.toJson(),
        "lab": lab?.toJson(),
      };
}

class Lab {
  String? referenceId;
  String? name;
  LabImage? image;

  Lab({
    this.referenceId,
    this.name,
    this.image,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        referenceId: json["reference_id"],
        name: json["name"],
        image: json["image"] == null ? null : LabImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "image": image?.toJson(),
      };
}

class LabImage {
  String? code;
  int? cacheValidity;

  LabImage({
    this.code,
    this.cacheValidity,
  });

  factory LabImage.fromJson(Map<String, dynamic> json) => LabImage(
        code: json["code"],
        cacheValidity: json["cache_validity"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "cache_validity": cacheValidity,
      };
}

class Test {
  String? referenceId;
  TitleImageClass? image;
  TestCategory? testCategory;
  List<Sample>? samples;
  String? parameters;
  List<Advice>? advices;
  IncludedTests? includedTests;

  Test({
    this.referenceId,
    this.image,
    this.testCategory,
    this.samples,
    this.parameters,
    this.advices,
    this.includedTests,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        referenceId: json["reference_id"],
        image: json["image"] == null ? null : TitleImageClass.fromJson(json["image"]),
        testCategory: json["test_category"] == null ? null : TestCategory.fromJson(json["test_category"]),
        samples: json["samples"] == null ? [] : List<Sample>.from(json["samples"]!.map((x) => Sample.fromJson(x))),
        parameters: json["parameters"],
        advices: json["advices"] == null ? [] : List<Advice>.from(json["advices"]!.map((x) => Advice.fromJson(x))),
        includedTests: json["included_tests"] == null ? null : IncludedTests.fromJson(json["included_tests"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "image": image?.toJson(),
        "test_category": testCategory?.toJson(),
        "samples": samples == null ? [] : List<dynamic>.from(samples!.map((x) => x.toJson())),
        "parameters": parameters,
        "advices": advices == null ? [] : List<dynamic>.from(advices!.map((x) => x.toJson())),
        "included_tests": includedTests?.toJson(),
      };
}

class Advice {
  String? title;
  AdviceImage? image;

  Advice({
    this.title,
    this.image,
  });

  factory Advice.fromJson(Map<String, dynamic> json) => Advice(
        title: json["title"],
        image: json["image"] == null ? null : AdviceImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image?.toJson(),
      };
}

class AdviceImage {
  String? code;

  AdviceImage({
    this.code,
  });

  factory AdviceImage.fromJson(Map<String, dynamic> json) => AdviceImage(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class TitleImageClass {
  TitleImageClass();

  factory TitleImageClass.fromJson(Map<String, dynamic> json) => TitleImageClass();

  Map<String, dynamic> toJson() => {};
}

class IncludedTests {
  String? count;
  List<String>? names;

  IncludedTests({
    this.count,
    this.names,
  });

  factory IncludedTests.fromJson(Map<String, dynamic> json) => IncludedTests(
        count: json["count"],
        names: json["names"] == null ? [] : List<String>.from(json["names"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x)),
      };
}

class Sample {
  String? name;
  AdviceImage? image;

  Sample({
    this.name,
    this.image,
  });

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        name: json["name"],
        image: json["image"] == null ? null : AdviceImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image?.toJson(),
      };
}

class TestCategory {
  TitleImageClass? image;
  Cta? cta;

  TestCategory({
    this.image,
    this.cta,
  });

  factory TestCategory.fromJson(Map<String, dynamic> json) => TestCategory(
        image: json["image"] == null ? null : TitleImageClass.fromJson(json["image"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "cta": cta?.toJson(),
      };
}

class Cta {
  TitleImageClass? titleImage;

  Cta({
    this.titleImage,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
        titleImage: json["title_image"] == null ? null : TitleImageClass.fromJson(json["title_image"]),
      );

  Map<String, dynamic> toJson() => {
        "title_image": titleImage?.toJson(),
      };
}
