import 'package:aidnix/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Aidnix',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.light(background: kWhite),
            textTheme: TextTheme(
              titleSmall: TextStyle(color: kBlack, fontSize: 18),
            ),
          ),
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            colorScheme: ColorScheme.dark(background: kBlack),
            textTheme: TextTheme(
              titleSmall: TextStyle(color: kWhite, fontSize: 18),
            ),
          ),
          initialRoute: Routes.splashScreen,
          getPages: Routes.routes,
        );
      },
    );
  }
}
