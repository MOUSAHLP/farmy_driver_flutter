class OrderDetailsModel {
  int id;
  int orderNumber;
  String? userPhone;
  String? status;
  String? deliveryMethod;
  String? orderTime;
  String? orderDate;
  String? userAddress;
  String? paymentMethod;
  bool? paymentStatus;
  String? couponDiscount;
  String? deliveryFee;
  String? subTotal;
  int? total;
  String? notes;
  List<int>? changes;
  List<String>? deliveryAttributes;
  List<OrderDetail>? orderDetails;

  OrderDetailsModel({
  required  this.id,
   required this.orderNumber,
    this.userPhone,
    this.status,
    this.deliveryMethod,
    this.orderTime,
    this.orderDate,
    this.userAddress,
    this.paymentMethod,
    this.paymentStatus,
    this.couponDiscount,
    this.deliveryFee,
    this.subTotal,
    this.total,
    this.notes,
    this.changes,
    this.deliveryAttributes,
    this.orderDetails,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"],
    orderNumber: json["order_number"],
    userPhone: json["user_phone"],
    status: json["status"],
    deliveryMethod: json["delivery_method"],
    orderTime: json["order_time"],
    orderDate: json["order_date"],
    userAddress: json["user_address"],
    paymentMethod: json["payment_method"],
    paymentStatus: json["payment_status"],
    couponDiscount: json["coupon_discount"],
    deliveryFee: json["delivery_fee"],
    subTotal: json["sub_total"],
    total: json["total"],
    notes: json["notes"],
    changes: List<int>.from(json["changes"].map((x) => x)),
    deliveryAttributes: List<String>.from(json["deliveryAttributes"].map((x) => x)),
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
  );
}

class OrderDetail {
  int id;
  String? name;
  String? image;
  String? quantity;
  String? price;
  List<Attribute>? attributes;

  OrderDetail({
  required  this.id,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.attributes,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    quantity: json["quantity"],
    price: json["price"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
  );
}

class Attribute {
  String? name;
  String? value;

  Attribute({
    this.name,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}
