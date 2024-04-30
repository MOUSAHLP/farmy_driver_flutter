import 'order_model.dart';

class HomeModel {
  String driverName;
  String driverRank;
  List<OrderModel>? asignedOrders;
  int? acceptanceRate;
  bool? isActive;

  HomeModel({
    required this.driverName,
    required this.driverRank,
    this.asignedOrders,
    this.acceptanceRate,
    this.isActive,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        driverName: json["driver_name"],
        driverRank: json["driver_rank"],
        isActive: json["is_active"],
        asignedOrders: OrderModel.listFromJson(json['asigned_orders'] ?? []),
        acceptanceRate: json["acceptance_rate"],
      );

  Map<String, dynamic> toJson() => {
        "driver_name": driverName,
        "driver_rank": driverRank,
        "asigned_orders": List<dynamic>.from(asignedOrders!.map((x) => x)),
        "acceptance_rate": acceptanceRate,
      };
}
