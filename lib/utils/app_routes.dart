import 'package:aidnix/View/CheckupScreen/checkup_screen.dart';
import 'package:aidnix/View/CheckupScreen/lab_details_sacreen.dart';
import 'package:aidnix/View/CheckupScreen/lab_image_screen.dart';
import 'package:aidnix/View/HomeScreen/home_screen.dart';
import 'package:aidnix/View/search/search_lab_listing_screen.dart';
import 'package:aidnix/view/auth/login_screen.dart';
import 'package:aidnix/view/auth/onBoarding/onboarding_screen.dart';
import 'package:aidnix/view/auth/otp_screen.dart';
import 'package:aidnix/view/auth/splash_screen.dart';
import 'package:aidnix/view/checkupScreen/test_details_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  static String splashScreen = "/splash";
  static String homeScreen = "/home";
  static String searchListingScreen = "/searchListing";
  static String onboardingScreen = "/Onboarding";
  static String otpScreen = "/Otp";
  static String loginScreen = "/Login";
  static String checkupScreen = "/Checkup";
  static String labDetailsScreen = "/labDetails";
  static String labImageScreen = "/labImage";
  static String testDetailsScreen = "/testDetails";

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
    GetPage(
      name: searchListingScreen,
      page: () => const SearchLabListingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: onboardingScreen,
      page: () => const OnboardingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: checkupScreen,
      page: () => const CheckupScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: labDetailsScreen,
      page: () => const LabDetailsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: labImageScreen,
      page: () => const LabImageScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: testDetailsScreen,
      page: () => const TestDetailsScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
