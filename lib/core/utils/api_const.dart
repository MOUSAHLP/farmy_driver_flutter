class ApiConst {
  static const String baseUrl =
      "https://farmy.driver.peaklink.site/api";

  ///Auth
  static const String login = "/auth/login";

  ///Home
  static const String getLastOrders = "/orders";
  static  String acceptOrder(int id) => "/accept-order/$id";
  ///orders
  static const String getOrders = "/driver-orders";
  static  String getOrdersDetails(int id) => "/driver-orders/$id?lang=ar";

}
