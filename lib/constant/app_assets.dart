import 'package:flutter/material.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconPath = "assets/icons/";

  static const google = "${imagePath}google.png";
  static const homeFirstLabTest = "${imagePath}homeFirstLabTest.png";
  static const homeBookPrescription = "${imagePath}homeBookPrescription.png";
  static const whatsAppLogo = "${imagePath}whatsAppLogo.png";
  static const callIcon = "${imagePath}callIcon.png";
  static const bloodTestIcon = "${imagePath}bloodTestIcon.png";
  static const homePathLab = "${imagePath}homePathLab.png";
  static const homePathLabTwo = "${imagePath}homePathLab_two.png";
  static const noDataFoundImage = "${imagePath}noDataFoundImage.png";
  static const fileImage = "${imagePath}fileImage.png";
  static const camera = "${imagePath}camera.png";
  static const addressLock = "${imagePath}address_lock.png";
  static const familyMember = "${imagePath}family_member.png";
  static const privacyPolicy = "${imagePath}privacy_policy.png";
  static const chatWithUs = "${imagePath}chat_with_us.png";
  static const logout = "${imagePath}logout.png";

//
  static const logo = "${imagePath}logo.png";
  static const splashBG = "${imagePath}splash_screen.png";
  static const onboardingImage = "${imagePath}onboarding_image.png";
  static const checkupBG = "${imagePath}checkupBG.png";
  static const dummy = "${imagePath}dummy.png";
  static const dummyDoctor = "${imagePath}dummy_doctor.png";
  static const labImage = "${imagePath}lab.png";
  static const labProfile = "${imagePath}image_lab_profile.png";

  ///Icons
  static const streamLine = "${iconPath}Icon_stream_line.svg";
  static const vector = "${iconPath}icons_vector.svg";
  static const whatsapp = "${iconPath}icon_whatsapp.svg";
  static const verify = "${iconPath}icon_verify.svg";
  static const starIcons = "${iconPath}icon_star.svg";
  static const microscope = "${iconPath}icon_microscope-fill.svg";
  static const medical = "${iconPath}icon_medical.svg";
  static const bloodTest = "${iconPath}icon_blood_test.svg";
  static const location2 = "${iconPath}icon_location_2.svg";
  static const vacation = "${iconPath}icon_vacation.svg";

  static const backArrow = "${iconPath}back_arrow.png";
  static const editIcon = "${iconPath}edit_icon.png";
  static const mailIcon = "${iconPath}mail_icon.png";
  static const personIcon = "${iconPath}person_icon.png";
  static const notificationIcon = "${iconPath}notification_icon.png";
  static const healthRecord = "${iconPath}health_record.png";
  static const report = "${iconPath}icon_report.svg";
  static const food = "${iconPath}icon_food.svg";
  static const person = "${iconPath}icon_person.svg";
  static const blood = "${iconPath}icon_blood_test.svg";
  static const delete = "${iconPath}icon_delete.svg";
  static const wrongCart = "${iconPath}icon_wrong_cart.svg";
  static const calender = "${iconPath}icon_calender.svg";
  static const clock = "${iconPath}icon_clock.svg";
  static const morning = "${iconPath}icon_morning.svg";
  static const evening = "${iconPath}icon_evening.svg";
  static const afternoon = "${iconPath}icon_afternoon.svg";
  static const bloodTesting = "${iconPath}icon_blood_testing.png";
  static const urineTesting = "${iconPath}icon_urine_testing.png";
  static const heartTesting = "${iconPath}icon_heart_testing.png";
}

Widget assetImage(String image,
    {double? height, double? width, Color? color, double? scale}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    color: color,
    scale: scale,
    fit: BoxFit.cover,
  );
}
