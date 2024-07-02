import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/core/utils/api_const.dart';
import 'package:pharmy_driver/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharmy_driver/models/all_orders_model.dart';

class AllOrdersRepo {
  static Future<Either<String, List<AllOrdersModel>>> getDriverAllOrders() {
    return BaseApiClient.get<List<AllOrdersModel>>(
        url: ApiConst.getDriverAllOrders,
        converter: (e) {
          return AllOrdersModel.listFromJson(e["data"]);
        });
  }
}
