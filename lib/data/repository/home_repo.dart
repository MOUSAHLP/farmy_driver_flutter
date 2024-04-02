import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/order_model.dart';

import '../../core/utils/api_const.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class HomeRepository{
  static Future<Either<String, List<OrderModel>>> getLastOrder() {
    return BaseApiClient.get<List<OrderModel>>(
      url: ApiConst.getLastOrders,
      converter: (e) {
        return OrderModel.listFromJson(e["data"]);
      },
    );
  }
  static Future<Either<String, bool>> acceptOrder(int id) {
    return BaseApiClient.get<bool>(
      url: ApiConst.acceptOrder(id),
      converter: (e) {
        return true;
      },
    );
  }

}