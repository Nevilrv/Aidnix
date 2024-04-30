import 'package:aidnix/View/HomeScreen/home_screen.dart';
import 'package:aidnix/View/SplashScreen/splash_screen.dart';
import 'package:aidnix/view/search/search_lab_listing_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  static String splashScreen = "/splash";
  static String homeScreen = "/home";
  static String searchListingScreen = "/searchListing";

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
      name: searchListingScreen,
      page: () => const SearchLabListingScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
