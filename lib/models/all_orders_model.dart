class AllOrdersModel {
  int? id;
  int? orderNumber;
  String? status;
  String? orderDate;
  int? total;

  AllOrdersModel(
      {this.id, this.orderNumber, this.status, this.orderDate, this.total});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    status = json['status'];
    orderDate = json['order_date'];
    total = json['total'];
  }

  static List<AllOrdersModel> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => AllOrdersModel.fromJson(value)).toList();
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
