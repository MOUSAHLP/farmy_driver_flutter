import 'package:pharmy_driver/models/product_model.dart';

class OrdersHistorymodel {
  Map<String, int>? weekData;
  int? ordersCount;
  List<ProductModel>? driverOrders;

  OrdersHistorymodel({this.weekData, this.ordersCount, this.driverOrders});

  OrdersHistorymodel.fromJson(Map<String, dynamic> json) {
    weekData = json['week_data'];
    ordersCount = json['orders_count'];
    if (json['driver_orders'] != null) {
      driverOrders = <ProductModel>[];
      json['driver_orders'].forEach((v) {
        driverOrders!.add(ProductModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};

  //   data['week_data'] = weekData;
  //   data['orders_count'] = ordersCount;
  //   if (driverOrders != null) {
  //     data['driver_orders'] = driverOrders!.map((v) => v.toJson()).toList();
  //   }
  //   data['driver_orders'] =  driverOrders;
  //   return data;
  // }
}
