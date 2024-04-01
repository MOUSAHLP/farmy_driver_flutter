class ApiConst {
  static const String baseUrl = "https://farmy.driver.peaklink.site/api";

  ///Auth
  static const String login = "/auth/login";

  ///Home
  static const String getOrders = "/orders";

  ///Orders History
  static String getDriverOrdersHistory(String date, String type) =>
      "$baseUrl/get-driver-orders-history?date=$date&type=$type";

  static String getDriverOrdersStatistics(String date, String type) =>
      "$baseUrl/get-orders-statistics?date=$date&type=$type";
}
