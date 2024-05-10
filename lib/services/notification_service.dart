import 'dart:developer';

import 'package:aidnix/utils/shared_prefs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class AppNotificationHandler {
  ///get fcm token
  static Future getFcmToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

   String? token = await firebaseMessaging.getToken();
    log("=========fcm-token===$token");


    preferences.setString(SharedPreference.fcmToken, token.toString());

    print('====FCM TOKEN======${preferences.getString(SharedPreference.fcmToken)}');
    return token;

  }
}
