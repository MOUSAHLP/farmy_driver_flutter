import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/core/utils/api_const.dart';
import 'package:pharmy_driver/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharmy_driver/models/transactions_model.dart';

class TransactionsRepo {
  static Future<Either<String, TransactionsModel>> getDriverDriverDues() {
    return BaseApiClient.get<TransactionsModel>(
        url: ApiConst.getDriverDriverDues,
        converter: (e) {
          return TransactionsModel.fromJson(e["data"]);
        });
  }
}
