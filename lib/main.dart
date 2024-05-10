import 'package:aidnix/services/notification_service.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/screen_size.dart';
import 'package:aidnix/utils/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA36i6aChLtOHeaY3O78dBoFHupfVGzPuo",
          appId: "1:927856155632:android:9c32401f22789bc9d99b35",
          messagingSenderId: "927856155632",
          projectId: "aidnix-491bf"));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await preferences.init();
  AppNotificationHandler.getFcmToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        ScreenSize.init(context);

        return GetMaterialApp(
          title: 'Aidnix',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.light(background: kWhite),
            fontFamily: "Poppins",
            textTheme: TextTheme(
              titleSmall: TextStyle(color: kBlack, fontSize: 18.sp),
            ),
          ),
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            colorScheme: ColorScheme.dark(background: kBlack),
            fontFamily: "Poppins",
            textTheme: TextTheme(
              titleSmall: TextStyle(color: kWhite, fontSize: 18.sp),
            ),
          ),
          initialRoute: Routes.splashScreen,
          getPages: Routes.routes,
        );
      },
    );
  }
}
