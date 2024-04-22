import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/order_model.dart';

import '../../core/utils/api_const.dart';
import '../../models/home_model.dart';
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
  static Future<Either<String, HomeModel>> getHome() {
    return BaseApiClient.get<HomeModel>(
      url: ApiConst.getHome,
      converter: (e) {
        return HomeModel.fromJson(e["data"]);
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
  static Future<Either<String, bool>> acceptOrderAssign(int id) {
    return BaseApiClient.get<bool>(
      url: ApiConst.acceptOrderAssign(id),
      converter: (e) {
        return true;
      },
    );
  }

}