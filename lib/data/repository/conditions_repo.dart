import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/condition_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class ConditionsRepo {
  static Future<Either<String, ConditionModel>> getConditions() {
    return BaseApiClient.get<ConditionModel>(
        url: ApiConst.getConditions,
        converter: (e) {
          return ConditionModel.fromJson(e);
        });
  }
}
