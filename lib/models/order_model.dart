class OrderModel {
  int orderNumber;
  String location;
  int? status;
  String? date;
  String? time;

  OrderModel({
   required this.orderNumber,
   required this.location,
    this.status,
    this.date,
    this.time,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderNumber: json["order_number"],
    location: json["location"],
    status: json["status"],
    date: json["date"],
    time: json["time"],
  );

  static List<OrderModel> listFromJson( List<dynamic> json){
    return json.map((value) =>OrderModel.fromJson(value) ).toList();
  }
}