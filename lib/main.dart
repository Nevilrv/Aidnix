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
            colorScheme: const ColorScheme.light(background: Colors.white),
            textTheme: const TextTheme(
              titleSmall: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            colorScheme: const ColorScheme.dark(background: Colors.black),
            textTheme: const TextTheme(
              titleSmall: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          initialRoute: Routes.testDetailsScreen,
          getPages: Routes.routes,
        );
      },
    );
  }
}
