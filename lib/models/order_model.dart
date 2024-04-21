class OrderModel {
  int id;
  int orderNumber;
  String? userPhone;
  String? status;
  String? deliveryMethod;
  String? orderTime;
  String? orderDate;
  String? userAddress;
  String? location;
  String? date;
  String? time;

  OrderModel({
   required this.id,
 required   this.orderNumber,
    this.userPhone,
    this.status,
    this.deliveryMethod,
    this.orderTime,
    this.orderDate,
    this.userAddress,
    this.location,
    this.date,
    this.time,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    orderNumber: json["order_number"],
    userPhone: json["user_phone"],
    status: json["status"].toString(),
    deliveryMethod: json["delivery_method"],
    orderTime: json["order_time"],
    orderDate: json["order_date"],
    userAddress: json["user_address"],
    location: json["location"],
    date: json["date"],
    time: json["time"],
  );


  static List<OrderModel> listFromJson( List<dynamic> json){
    return json.map((value) =>OrderModel.fromJson(value) ).toList();
  }
}