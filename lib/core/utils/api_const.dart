class ApiConst {
  static const String baseUrl = "https://farmy.driver.peaklink.site/api";

  ///Auth
  static const String login = "/login";
  static const String logout = "/logout";
  static const String updateProfile = "/update_profile";
  static const String deleteAccount = "/delete_account";
  static const String resetPassword = "/change_password";

  ///Setting
  static const String contactUs = "/contact_us";
  static const String getPrivacy = "/policy";
  static const String getConditions = "/conditions";
  static const String getFaqQuestions = "/faq_questions";
  static const String getAbout = "/about_the_app";
  static const String getTerm = "/use_terms";


  /// Setting
  static const String getSetting = "/setting";


  ///Home
  static const String getHome = "/get_home";
  static const String getLastOrders = "/orders";
  static  String acceptOrder(int id) => "/accept-order/$id";
  static  String acceptOrderAssign(int id) => "/accept-assigned-order/$id";
  static  String chengActive = "/active-inactive";

  static  String getTrackingUrl(int idOrder) => "/order-tracking/$idOrder";
  static  String deliverOrder(int idOrder) => "/deliver-order/$idOrder";
  ///orders
  static const String getOrders = "/driver-orders";
  static  String getOrdersDetails(int id) => "/driver-orders/$id?lang=ar";

  ///Orders History
  static String getDriverOrdersHistory(String date, String type) =>
      "/get-driver-orders-history?date=$date&type=$type";

  static String getDriverOrdersStatistics(String date, String type) =>
      "/get-orders-statistics?date=$date&type=$type";

  ///Transactions
  static const String getDriverDriverDues = "/driver-dues";

  ///All Orders
  static const String getDriverAllOrders = "/all-orders";
  static const String generatePdfAllOrders = "/generate-pdf-all-orders";

  ///Notifactuon
  static const String getNotifications = "/notifications";
}
