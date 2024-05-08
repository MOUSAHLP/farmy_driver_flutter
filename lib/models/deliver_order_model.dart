class DeliverOrder {
  final String status;
  final String message;
  final Data data;
  final int statusCode;

  DeliverOrder({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory DeliverOrder.fromJson(Map<String, dynamic> json) => DeliverOrder(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    statusCode: json["statusCode"],
  );


}

class Data {
  final int? orderTotal;

  Data({
    required this.orderTotal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderTotal: json["order_total"],
  );


}
