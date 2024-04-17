import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/setting_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class SettingRepo {
  static Future<Either<String, SettingModel>> getSetting() {
    return BaseApiClient.get<SettingModel>(
        url: ApiConst.getSetting,
        converter: (e) {
          return SettingModel.fromJson(e);
        });
  }
}
