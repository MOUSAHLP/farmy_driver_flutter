import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/core/utils/api_const.dart';
import 'package:pharmy_driver/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharmy_driver/models/order_history_model.dart';

class OrderHistoryRepo {
  static Future<Either<String, OrdersHistorymodel>> getDriverOrdersHistory(
      String date, String type) {
    return BaseApiClient.get<OrdersHistorymodel>(
        url: ApiConst.getDriverOrdersHistory(date, type),
        converter: (e) {
          return OrdersHistorymodel.fromJson(e["data"]);
        });
  }
}
