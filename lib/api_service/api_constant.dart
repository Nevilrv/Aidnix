class AppUrls {
  /// API BASE URL

  static const BASE_URL = "http://ec2-65-2-63-121.ap-south-1.compute.amazonaws.com:8080/api";

  static const Duration responseTimeOut = Duration(seconds: 60);

  /// API End Points

  // Auth

  static const login = "/users/login";
  static const verifyOtp = "/users/verify-otp";
  static const termsAndConditions = "/terms-and-conditions";
  static const privacyPolicy = "/privacy-policy";
  static const aboutUs = "/about-us";
  static const logout = "/logout";

  // Home

  static const home = "/home";
  static const categories = "/test-categories";

  // Address

  static const addresses = "/addresses";

  // User

  static const familyMember = "/family-members";
  static const uploadDocument = "/v2/docs/upload";
  static const profileSetting = "/customers/profile-settings";
  static const healthProfile = "/customers/health-profile";
  static const healthDocs = "/docs";

  // Booking

  static const bookings = "/bookings";

  // Lab

  static const labs = "/labs";
  static const labItems = "/lab-items";

// Cart
  static const cart = "/cart";
  static const cartSummary = "/cart-summary";
}
