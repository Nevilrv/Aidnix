import 'package:aidnix/constant/app_color.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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
        return GetMaterialApp(
          title: 'Aidnix',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: const ColorScheme.light(background: AppColors.whiteColor),
            textTheme: const TextTheme(
              titleSmall: TextStyle(color: AppColors.blackColor, fontSize: 18),
            ),
          ),
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            colorScheme: const ColorScheme.dark(background: AppColors.blackColor),
            textTheme: const TextTheme(
              titleSmall: TextStyle(color: AppColors.whiteColor, fontSize: 18),
            ),
          ),
          initialRoute: Routes.dashboardScreen,
          getPages: Routes.routes,
        );
      },
    );
  }
}
