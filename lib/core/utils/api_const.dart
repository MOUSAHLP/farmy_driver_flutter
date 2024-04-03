class ApiConst {
  static const String baseUrl = "https://farmy.driver.peaklink.site/api";

  ///Auth
  static const String login = "/login";
  static const String logout = "/logout";
  static const String updateProfile = "/update_profile";


  ///Home
  static const String getLastOrders = "/orders";
  static  String acceptOrder(int id) => "/accept-order/$id";
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
}
