import 'dart:async';
import 'package:aidnix/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
// import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'Utils/app_routes.dart';

// Completer<AndroidMapRenderer?>? initializedRendererCompleter;
//
// Future<AndroidMapRenderer?> initializeMapRenderer() async {
//   if (initializedRendererCompleter != null) {
//     return initializedRendererCompleter!.future;
//   }
//
//   final Completer<AndroidMapRenderer?> completer = Completer<AndroidMapRenderer?>();
//   initializedRendererCompleter = completer;
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
//   if (mapsImplementation is GoogleMapsFlutterAndroid) {
//     unawaited(mapsImplementation
//         .initializeWithRenderer(AndroidMapRenderer.latest)
//         .then((AndroidMapRenderer initializedRenderer) => completer.complete(initializedRenderer)));
//   } else {
//     completer.complete(null);
//   }
//
//   return completer.future;
// }

void main() {
  // final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
  // if (mapsImplementation is GoogleMapsFlutterAndroid) {
  //   mapsImplementation.useAndroidViewSurface = true;
  //   initializeMapRenderer();
  // }

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
