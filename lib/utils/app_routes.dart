import 'package:aidnix/view/dashboard/dashboard_screen.dart';
import 'package:aidnix/view/general_setting/general_setting_screen.dart';
import 'package:aidnix/view/health_profile/health_profile_screen.dart';
import 'package:aidnix/view/health_records/health_records_screen.dart';
import 'package:aidnix/view/home/home_screen.dart';
import 'package:aidnix/view/search/search_lab_listing_screen.dart';
import 'package:aidnix/view/splash/splash_screen.dart';
import 'package:aidnix/view/CheckupScreen/checkup_screen.dart';
import 'package:aidnix/view/CheckupScreen/lab_details_sacreen.dart';
import 'package:aidnix/view/CheckupScreen/lab_image_screen.dart';
import 'package:aidnix/view/auth/login_screen.dart';
import 'package:aidnix/view/auth/onBoarding/onboarding_screen.dart';
import 'package:aidnix/view/auth/otp_screen.dart';
import 'package:aidnix/view/checkupScreen/test_details_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  static String splashScreen = "/splash";
  static String dashboardScreen = "/dashboard";
  static String homeScreen = "/home";
  static String searchListingScreen = "/searchListing";
  static String healthRecordsScreen = "/healthRecords";
  static String generalSettingScreen = "/generalSetting";
  static String healthProfileScreen = "/healthProfile";
  static String onboardingScreen = "/Onboarding";
  static String otpScreen = "/Otp";
  static String loginScreen = "/Login";
  static String checkupScreen = "/Checkup";
  static String labDetailsScreen = "/labDetails";
  static String labImageScreen = "/labImage";
  static String testDetailsScreen = "/testDetails";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen(), transition: Transition.fadeIn),
    GetPage(
      name: dashboardScreen,
      page: () => const DashboardScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
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
      name: healthRecordsScreen,
      page: () => const HealthRecordsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: generalSettingScreen,
      page: () => const GeneralSettingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: healthProfileScreen,
      page: () => const HealthProfileScreen(),
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
