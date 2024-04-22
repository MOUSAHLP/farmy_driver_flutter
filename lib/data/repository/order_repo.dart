import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/order_model.dart';

import '../../core/utils/api_const.dart';
import '../../models/order_details_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class OrderRepository{
  static Future<Either<String, List<OrderModel>>> getOrder() {
    return BaseApiClient.get<List<OrderModel>>(
      url: ApiConst.getOrders,
      converter: (e) {
        return OrderModel.listFromJson(e["data"]);
      },
    );
  }
  static Future<Either<String, OrderDetailsModel>> getOrderDetails(int id) {
    return BaseApiClient.get<OrderDetailsModel>(
      url: ApiConst.getOrdersDetails(id),
      converter: (e) {
        return OrderDetailsModel.fromJson(e["data"]);
      },
    );
  }
  static Future<Either<String, bool>> updateOrder(int id,List<int> accept,List<int> cancel) {
    return BaseApiClient.put<bool>(
      url: ApiConst.getOrdersDetails(id),
      formData: {
        "approved_products_ids":accept,
        "canceled_products_ids":cancel
      },
      converter: (e) {
        return true;
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