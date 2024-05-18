import 'dart:io';

import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launch Url
Future launchUrlMethod(String link) async {
  Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}

/// Launch Dial
Future launchUrlDailMethod(String mobileNo) async {
  final Uri mobileLaunchUri = Uri(
    scheme: 'tel',
    path: mobileNo,
  );

  if (await canLaunchUrl(mobileLaunchUri)) {
    await launchUrl(mobileLaunchUri);
  }
}

/// Launch WhatsApp
launchWhatsappMethod(BuildContext context, String whatsapp) async {
  var whatsappAndroid = Uri.parse("whatsapp://send?phone=${whatsapp.contains("+") ? whatsapp : '+91$whatsapp'}");
  var iosUrl = "https://wa.me/${whatsapp.contains("+") ? whatsapp : '+91$whatsapp'}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(whatsappAndroid);
    }
  } on Exception {
    showErrorSnackBar("WhatsApp Not Found!");
  }
}

///   3f6d0d12-9050-4e54-ba5f-64d6283b7509
///   3f6d0d12-9050-4e54-ba5f-64d6283b7509