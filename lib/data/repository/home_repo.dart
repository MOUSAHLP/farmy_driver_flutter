import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/order_model.dart';

import '../../core/utils/api_const.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class HomeRepository{
  static Future<Either<String, List<OrderModel>>> getLastOrder() {
    return BaseApiClient.get<List<OrderModel>>(
      url: ApiConst.getOrders,
      converter: (e) {
        return OrderModel.listFromJson(e["data"]);
      },
    );
  }
}