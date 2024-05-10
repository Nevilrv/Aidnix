class AppUrls {
  /// API BASE URL

  static const BASE_URL = "http://ec2-65-2-63-121.ap-south-1.compute.amazonaws.com:8080/api";

  static const Duration responseTimeOut = Duration(seconds: 60);

  /// API End Points

  // Auth

  static const login = "/users/login";
  static const verifyOtp = "/users/verify-otp";

  // Home

  static const home = "/home";
  static const categories = "/test-categories";
  static const subCategories = "/lab-items";
}
