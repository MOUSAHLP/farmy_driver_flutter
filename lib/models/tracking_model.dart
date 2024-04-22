class TrackingOrder {
  final String status;
  final String message;
  final String data;
  final int statusCode;

  TrackingOrder({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory TrackingOrder.fromJson(Map<String, dynamic> json) => TrackingOrder(
    status: json["status"],
    message: json["message"],
    data: json["data"],
    statusCode: json["statusCode"],
  );

}
