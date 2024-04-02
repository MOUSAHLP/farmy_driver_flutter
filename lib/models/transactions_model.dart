class TransactionsModel {
  String? driverDues;
  List<DueOrders>? orders;

  TransactionsModel({this.driverDues, this.orders});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    driverDues = json['driver_dues'];
    if (json['orders'] != null) {
      orders = <DueOrders>[];
      json['orders'].forEach((v) {
        orders!.add(DueOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_dues'] = driverDues;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DueOrders {
  int? orderNumber;
  String? createdAt;
  int? total;
  String? time;

  DueOrders({this.orderNumber, this.createdAt, this.total, this.time});

  DueOrders.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    createdAt = json['created_at'];
    total = json['total'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_number'] = orderNumber;
    data['created_at'] = createdAt;
    data['total'] = total;
    data['time'] = time;
    return data;
  }
}
