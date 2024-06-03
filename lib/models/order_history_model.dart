import 'package:pharmy_driver/models/statistics_model.dart';

class OrdersHistorymodel {
  StatisticsModel? statisticsdata;
  int? ordersCount;
   String ?pdfUrl;

  List<DriverOrders>? driverOrders;
  OrdersHistorymodel(
      {this.statisticsdata, this.ordersCount, this.driverOrders,required this.pdfUrl});

  OrdersHistorymodel.fromJson(Map<String, dynamic> json) {
    statisticsdata = StatisticsModel(
      monthData: json['month_data'],
      weekData: json['week_data'],
    );
    pdfUrl =json["pdf_url"];

    ordersCount = json['orders_count'];

    if (json['driver_orders'] != null) {
      driverOrders = <DriverOrders>[];
      json['driver_orders'].forEach((v) {
        driverOrders!.add(DriverOrders.fromJson(v));
      });
    }
  }
}

class DriverOrders {
  int? id;
  int? orderNumber;
  String? status;
  String? orderDate;
  int? total;

  DriverOrders(
      {this.id, this.orderNumber, this.status, this.orderDate, this.total});

  DriverOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    status = json['status'];
    orderDate = json['order_date'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['status'] = status;
    data['order_date'] = orderDate;
    data['total'] = total;
    return data;
  }
}
